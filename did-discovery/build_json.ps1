# Build the two deliverables from everything in data\:
#   output\ford_transit_2021_discovery.json  - every module, ID, DTC, DID (raw + decoded) found so far
#   output\ford_transit_2021_wican_profile.json - WiCAN AutoPID profile (profile-editor format) for live values
. (Join-Path $PSScriptRoot 'wican.ps1')
$data = Join-Path $PSScriptRoot 'data'; $outDir = Join-Path $PSScriptRoot 'output'; New-Item -ItemType Directory -Force $outDir | Out-Null
$L = (Get-Content -Raw -Encoding UTF8 (Join-Path $PSScriptRoot 'refs\ford_did_library.json') | ConvertFrom-Json).entries
function J($f) { if (Test-Path $f) { Get-Content -Raw -Encoding UTF8 $f | ConvertFrom-Json } }
$info = try { Invoke-RestMethod -TimeoutSec 5 "$script:WiCAN/api/info" } catch { $null }

function DtcText([int]$s) {
    $f = @(); if ($s -band 1) { $f += 'failing now' }; if ($s -band 8) { $f += 'confirmed' } elseif ($s -band 4) { $f += 'pending' }
    if (($s -band 0x20) -and -not ($s -band 9)) { $f += 'failed since clear' }; if ($s -band 0x80) { $f += 'warning lamp' }
    if (-not $f) { $f += $(if ($s -band 0x40) { 'not tested this cycle' } else { 'stored, inactive' }) }; $f -join ', '
}
function ParseDtcs([string]$raw) {
    if (-not $raw -or -not $raw.StartsWith('59')) { return @() }
    $b = $raw -split ' '; $o = @()
    for ($i = 3; $i + 3 -lt $b.Length; $i += 4) {
        $c = [Convert]::ToInt32($b[$i],16); $s = [Convert]::ToInt32($b[$i+3],16)
        $o += [ordered]@{ dtc = ('{0}{1:X1}{2:X1}{3}-{4}' -f 'PCBU'[($c -shr 6) -band 3], (($c -shr 4) -band 3), ($c -band 0xF), $b[$i+1], $b[$i+2]); status_byte = "0x$($b[$i+3])"; status = (DtcText $s) }
    }
    $o
}

# Researched candidates (refs\research\*.json), keyed "TX:DID", only those not already in the library
$script:research = @{}
foreach ($f in Get-ChildItem (Join-Path $PSScriptRoot 'refs\research') -Filter *.json -ErrorAction SilentlyContinue) {
    try { $arr = Get-Content -Raw -Encoding UTF8 $f.FullName | ConvertFrom-Json } catch { continue }
    foreach ($c in @($arr)) {
        if (-not $c.did -or -not $c.tx) { continue }
        $did = ("$($c.did)" -replace '^0x','').ToUpper(); if ($did.Length -eq 6 -and $did.StartsWith('22')) { $did = $did.Substring(2) }
        if ($did -notmatch '^[0-9A-F]{4}$') { continue }
        $k = "$(("$($c.tx)" -replace '^0x','').ToUpper()):$did"
        if (-not $script:research.ContainsKey($k)) { $script:research[$k] = @() }
        $script:research[$k] += $c
    }
}

# Gather every module seen in any pass
$files = Get-ChildItem $data -Filter 'mod_*.json'
$txs = @($files | ForEach-Object { ($_.BaseName -split '_')[1] } | Sort-Object -Unique)
$modules = @()
foreach ($tx in $txs) {
    $p1 = J (Join-Path $data "mod_$($tx)_phase1.json"); $sd = J (Join-Path $data "mod_$($tx)_default.json"); $sx = J (Join-Path $data "mod_$($tx)_extended.json"); $ex = J (Join-Path $data "extra_$tx.json")
    $dids = [ordered]@{}
    foreach ($src in @(@($sd,'full sweep, default session'),@($sx,'full sweep, extended session'),@($p1,'phase 1 known-DID read'))) {
        $m = $src[0]; if (-not $m) { continue }
        foreach ($p in $m.dids.PSObject.Properties) {
            if (-not $dids.Contains($p.Name)) { $dids[$p.Name] = [ordered]@{ did = $p.Name; status = $p.Value.status; length = $p.Value.len; raw_hex = $p.Value.hex; ascii = $p.Value.ascii; found_by = @() } }
            elseif ($p.Value.status -eq 'ok') { $dids[$p.Name].status = 'ok'; $dids[$p.Name].raw_hex = $p.Value.hex; $dids[$p.Name].length = $p.Value.len; $dids[$p.Name].ascii = $p.Value.ascii }
            $dids[$p.Name].found_by += $src[1]
        }
    }
    # Decode every OK DID that the library knows (covers DIDs found only by the full sweep too)
    foreach ($d in $dids.Values) {
        $e = $L."$($tx):$($d.did)"
        $d.library_name = $(if ($e) { (@($e.signals) + @($e.repo_signals) | Where-Object { $_ } | ForEach-Object { $_.name }) -join '; ' } else { Get-DidName $d.did })
        $d.signals = @()
        $ov = $script:NativeOverrides["$($tx):$($d.did)"]
        if ($d.status -eq 'ok' -and $d.raw_hex) {
            $b = HexToBytes $d.raw_hex
            if ($ov) {   # the module's native definition first; source formulas follow as alternates
                $v = try { Convert-TorqueExpr $b $ov.formula } catch { $null }
                if ($ov.nullraw -and $b.Length -ge 2 -and ([int]$b[0] * 256 + $b[1]) -ge $ov.nullraw) { $v = $null }   # Ford 'no sensor' value
                $nm = $(if ($e -and @($e.signals | Where-Object { $_ })) { @($e.signals)[0].name } elseif ($e -and @($e.repo_signals | Where-Object { $_ })) { @($e.repo_signals)[0].name } else { Get-DidName $d.did })
                if (-not $nm) { $nm = "DID $($d.did)" }
                $d.signals += [ordered]@{ id = 'NATIVE'; name = $nm; group = 'native'; native = $true; value = $v; display = $(if ($null -eq $v) { 'not available' } else { ("$v $($ov.unit)").Trim() }); unit = $ov.unit; formula = $ov.formula; wican_expression = $ov.wican; source = 'native module definition'; notes = $ov.note }
            }
            if ($e) {
                foreach ($s in @($e.signals | Where-Object { $_ })) {
                    $nf = Get-NativeFmt $s.fmt; $v = Convert-Signal $b $s.fmt
                    $d.signals += [ordered]@{ id = $s.id; name = $s.name; group = $s.path; native = (-not $ov); value = $v.value; display = $v.display; unit = "$($nf.fmt.unit)"; formula = $nf.fmt; source = "OBDb $($e.defined_by)"; notes = $(if ($ov) { 'alternate source formula; see the NATIVE signal' } else { $nf.note }) }
                }
                foreach ($s in @($e.repo_signals | Where-Object { $_ })) {
                    $err = $null; $v = try { Convert-WicanExpr $b $s.expr } catch { $err = $_.Exception.Message; $null }
                    $imperial = "$($s.unit)" -match '(?i)^(psi|inhg|°?f|fahrenheit|mph|miles?|gal)'
                    $note = @($(if ($err) { "formula does not fit this van's reply: $err" }), $(if ($ov -or $imperial) { 'not in the native unit; kept for reference' })) | Where-Object { $_ }
                    $d.signals += [ordered]@{ id = $s.id; name = $s.name; group = 'WiCAN-Ford-Transit'; native = (-not $ov -and -not $imperial -and -not $err); value = $v; display = $(if ($err) { 'invalid for this van' } else { ("$v $($s.unit)").Trim() }); unit = $s.unit; expression = $s.expr; source = "WiCAN-Ford-Transit ($($s.repo_status))"; notes = ($note -join '; ') }
                }
            }
            # researched formulas (forums/datasets) for this DID, converted to native units where the source used imperial
            $rk = "$($tx):$($d.did)"
            if ($script:research.ContainsKey($rk)) {
                foreach ($c in $script:research[$rk]) {
                    if (-not $c.formula) { continue }
                    $rerr = $null; $v = try { Convert-TorqueExpr $b $c.formula $c.signed } catch { $rerr = $_.Exception.Message; $null }
                    $u = "$($c.unit)"; $cv = $script:ToMetric[($u.ToLower() -replace '°','' -replace '^f$','fahrenheit')]
                    if ($cv -and $null -ne $v) { $v = [Math]::Round($v * $cv.f + $cv.o, 4); $u = $cv.unit }
                    if ($rerr) { $c | Add-Member -Force -NotePropertyName notes -NotePropertyValue ("formula does not fit this van's reply ($rerr); " + $c.notes) }
                    $d.signals += [ordered]@{ id = 'RESEARCH'; name = $c.name; group = 'research'; native = (-not $ov -and -not $rerr); value = $v; display = $(if ($rerr) { 'invalid for this van' } else { ("$v $u").Trim() }); unit = $u; formula = $c.formula; signed = $c.signed
                        source = $c.source; confidence = $c.confidence; vehicles = $c.vehicles; notes = (@($c.notes, $(if ($cv) { "converted from the source's $($c.unit)" })) | Where-Object { $_ }) -join '; ' }
                }
            }
        }
        if ($ex -and $ex.dynamic -and $ex.dynamic.($d.did)) { $d.changing_bytes = @($ex.dynamic.($d.did)) }
        if ($ex -and $ex.scaling -and $ex.scaling.($d.did)) { $d.scaling_0x24 = $ex.scaling.($d.did) }
        if (-not $d.ascii) { $d.Remove('ascii') }
    }
    $ident = [ordered]@{}; foreach ($d in $dids.Values) { if ($d.did -like 'F1*' -and $d.ascii) { $ident[$d.did] = [ordered]@{ name = (Get-DidName $d.did); value = $d.ascii } } }
    $dtcRaw = $null; $supported = @()
    if ($ex -and $ex.dtc_reports.'19 0A') { $supported = @(ParseDtcs $ex.dtc_reports.'19 0A') }
    $active = @(); foreach ($m in @($p1,$sd)) { if ($m -and $m.dtcs) { foreach ($x in $m.dtcs) { if (([Convert]::ToInt32($x.status,16) -band 0xAF) -and $active.dtc -notcontains $x.dtc) { $active += [ordered]@{ dtc = $x.dtc; status_byte = "0x$($x.status)"; status = (DtcText ([Convert]::ToInt32($x.status,16))) } } } } }
    $sweeps = [ordered]@{}; foreach ($pair in @(@($sd,'default'),@($sx,'extended'))) { if ($pair[0]) { $sweeps[$pair[1]] = [ordered]@{ checked = $pair[0].progress.checked; of = $pair[0].progress.total; state = $pair[0].state } } }
    $modules += [ordered]@{
        tx = "0x$tx"; rx = "0x$(RxFor $tx)"; name = $(if ($script:ModuleNames[$tx]) { $script:ModuleNames[$tx] } else { 'Unknown' })
        identification = $ident
        dtcs = [ordered]@{ active_or_stored = $active; supported_count = $supported.Count; supported = $supported }
        dids_answered = @($dids.Values | Where-Object { $_.status -eq 'ok' }).Count
        dids_present_but_refused = @($dids.Values | Where-Object { $_.status -ne 'ok' }).Count
        dids = @($dids.Values)
        obd = @($(if ($p1 -and $p1.obd) { $p1.obd }) | Where-Object { $_ })
        full_sweep_progress = $sweeps
        library_dids_for_module = @($L.PSObject.Properties | Where-Object { $_.Value.hdr -eq $tx }).Count
    }
}

# One spelling per unit (the symbols Home Assistant expects); values are already native, this only renames.
$deg = [string][char]0xB0   # PowerShell 5.1 reads this BOM-less file as ANSI, so no literal degree sign
$unitNames = @{ 'celsius'="${deg}C"; 'percent'='%'; 'kilopascal'='kPa'; 'volts'='V'; 'amps'='A'; 'milliamps'='mA'; 'kilometers'='km'
    'kilometersPerHour'='km/h'; 'seconds'='s'; 'milliseconds'='ms'; 'newtonMeters'='Nm'; 'hours'='h'; 'liters'='L'; 'degrees'=$deg; 'deg'=$deg; 'hertz'='Hz'
    ([string][char]0xC2 + $deg + 'C') = "${deg}C"; ([string][char]0xC2 + $deg) = $deg }
foreach ($m in $modules) { foreach ($d in $m.dids) { foreach ($s in @($d.signals)) { if ($s -and $unitNames.ContainsKey("$($s.unit)")) { $s.unit = $unitNames["$($s.unit)"] } } } }

$discovery = [ordered]@{
    vehicle = [ordered]@{ make = 'Ford'; model = 'Transit'; model_year = 2021; vin = '1FTBW2CG5M*******'; vin_notes = '10th char M = 2021; 11th char K = Kansas City Assembly' }
    generated = (Get-Date).ToString('s')
    scanned_with = $(if ($info) { "$($info.model) fw $($info.fw_version), native CAN ISO-TP via /api/uds/request" } else { 'WiCAN Pro' })
    bus = [ordered]@{ pins = '6/14 (HS-CAN)'; bitrate_kbps = 500; addressing = '11-bit physical, response = request + 8'
        note = 'Modules stop answering physical requests after a while; a functional 7DF broadcast wakes them. Modules seen in but silent here (IPC, ABS, TCU, SODL/SODR) may sit on another bus that pins 6/14 do not reach.' }
    method = 'Read-only: 0x22 ReadDataByIdentifier, 0x19 ReadDTCInformation, 0x24 ReadScalingDataByIdentifier, 0x3E TesterPresent, 0x10 01/03, OBD modes 01/09.'
    sources = @('OBDb Ford signal sets, https://github.com/OBDb (CC BY-SA 4.0)', 'WiCAN-Ford-Transit PIDs.md, https://github.com/anthonysecco/WiCAN-Ford-Transit')
    modules = $modules
}
[IO.File]::WriteAllText((Join-Path $outDir 'ford_transit_2021_discovery.json'), ($discovery | ConvertTo-Json -Depth 14))

# ---- WiCAN profile: live, decodable values only (unsigned, byte-aligned), plus your verified repo expressions ----
function UnitInfo([string]$u) {
    switch -Exact ($u) { 'kPa' { return @('kPa','pressure') } 'psi' { return @('psi','pressure') } }
    switch ($u) { 'celsius' { @("$([char]0xB0)C",'temperature') } 'percent' { @('%','none') } 'volts' { @('V','voltage') } 'amps' { @('A','current') }
        'kilopascal' { @('kPa','pressure') } 'psi' { @('psi','pressure') } 'kilometersPerHour' { @('km/h','speed') } 'kilometers' { @('km','distance') }
        'rpm' { @('rpm','none') } 'offon' { @('','none') } 'noyes' { @('','none') } 'scalar' { @('','none') } 'unknown' { @('','none') } default { @($u,'none') } }
}
$pids = [ordered]@{}
foreach ($m in $modules) {
    $tx = $m.tx.Substring(2); $rx = $m.rx.Substring(2); $abbr = ($m.name -split ' ')[0].ToLower()
    foreach ($d in $m.dids) {
        if ($d.status -ne 'ok' -or -not $d.signals) { continue }
        if ($d.did -match '^(F1|DE|D1)') { continue }   # identification / config, not live values
        $params = @()
        $nat = @($d.signals | Where-Object { $_.id -eq 'NATIVE' })
        $repo = @($d.signals | Where-Object { $_.expression -and $_.native })
        foreach ($s in $nat) {
            $nm = "$abbr-$((($s.name -replace '[^A-Za-z0-9]+','-').Trim('-')).ToLower())"; if ($nm.Length -gt 48) { $nm = $nm.Substring(0,48) }
            $ui = UnitInfo $s.unit; $cls = $(if ($s.unit -match '(?i)kpa|psi|inhg') { 'pressure' } else { $ui[1] })
            $params += [ordered]@{ name = $nm; class = $cls; expression = $s.wican_expression; unit = $s.unit; min = ''; max = ''; type = 'MQTT_Topic'; send_to = "wican/$nm" }
        }
        if (-not $nat) { foreach ($s in $repo) { $params += [ordered]@{ name = "$abbr-$($s.id.ToLower() -replace '_','-')"; class = 'none'; expression = $s.expression; unit = $s.unit; min = ''; max = ''; type = 'MQTT_Topic'; send_to = "wican/$abbr-$($s.id.ToLower() -replace '_','-')" } } }
        if (-not $nat -and -not $repo) {
            foreach ($s in @($d.signals | Where-Object { $_.source -like 'OBDb*' })) {
                $f = $s.formula; if (-not $f -or $null -eq $s.value -or $f.map -or $f.sign) { continue }
                $bix = $(if ($null -ne $f.bix) { [int]$f.bix } else { 0 }); $len = [int]$f.len
                if (($bix % 8) -or ($len % 8) -or $len -gt 32) { continue }
                $first = 4 + $bix / 8; $last = $first + $len / 8 - 1
                $x = $(if ($len -eq 8) { "B$first" } else { "[B$($first):B$last]" })
                if ($f.mul) { $x = "$x*$($f.mul)" }; if ($f.div) { $x = "$x/$($f.div)" }; if ($f.add) { $x = "($x)+($($f.add))" }
                $ui = UnitInfo $s.unit; $nm = "$abbr-$(($s.id -replace '^[A-Z0-9]+?_','').ToLower() -replace '_','-')"
                $params += [ordered]@{ name = $nm; class = $ui[1]; expression = $x; unit = $ui[0]; min = ''; max = ''; type = 'MQTT_Topic'; send_to = "wican/$nm" }
            }
        }
        if ($params) { $pids["22$($d.did)|$tx"] = [ordered]@{ pid = "22$($d.did)"; pid_init = "ATSH$tx;STCAFCP$tx,$rx;"; parameters = $params } }
    }
}
$profile = [ordered]@{
    car_model = 'Ford: Transit 2021 (generated from WiCAN discovery)'
    init = 'ATE0;ATL0;ATH0;ATR1;ATST32;ATSP6;ATCAF1;'
    comment = "Generated $(Get-Date -f s) from live reads of VIN 1FTBW2CG5M*******. Only unsigned, byte-aligned signals that returned a value are included. Expressions: B4 = first data byte."
    pids = @($pids.Values)
}
[IO.File]::WriteAllText((Join-Path $outDir 'ford_transit_2021_wican_profile.json'), ($profile | ConvertTo-Json -Depth 8))
"discovery: $($modules.Count) modules, $(($modules | ForEach-Object { $_.dids_answered } | Measure-Object -Sum).Sum) DIDs answered, $(($modules | ForEach-Object { @($_.dids | ForEach-Object { $_.signals }).Count } | Measure-Object -Sum).Sum) decoded signals"
"profile: $($pids.Count) PIDs, $(($pids.Values | ForEach-Object { $_.parameters.Count } | Measure-Object -Sum).Sum) parameters"
