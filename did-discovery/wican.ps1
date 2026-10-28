# Shared helpers for talking to the WiCAN Pro UDS API (read-only requests only).
$script:WiCAN = 'http://10.0.0.124'

# Only these UDS services are ever sent: session control (0x10 01/03), tester present (0x3E),
# read DID (0x22), read DTCs (0x19), read scaling (0x24), OBD modes 01/09.
$script:AllowedPrefixes = @('10 01','10 03','3E','22','19 01','19 02','19 03','19 04','19 06','19 0A','24','01','09')

function Assert-ReadOnly([string]$data) {
    $d = ($data -replace '\s+',' ').Trim().ToUpper()
    foreach ($p in $script:AllowedPrefixes) { if ($d.StartsWith($p)) { return } }
    throw "Blocked non-read-only request: $d"
}

function RxFor([string]$tx) { '{0:X3}' -f ([Convert]::ToInt32($tx,16) + 8) }

# Modules on this van stop answering direct requests after a while; a functional (7DF) broadcast plus
# tester present wakes them again. Called automatically before retrying a timed-out request.
function Wake-Bus([string]$tx = $null) {
    try { $null = Invoke-RestMethod -TimeoutSec 5 -Method Post -ContentType 'application/json' -Body (@{ tx_id = '7DF'; rx_id = '7E8'; ext = $false; data = '01 00'; p2star_ms = 500 } | ConvertTo-Json -Compress) "$script:WiCAN/api/uds/request" } catch {}
    if ($tx -and $tx -ne '7DF') { try { $null = Invoke-RestMethod -TimeoutSec 5 -Method Post -ContentType 'application/json' -Body (@{ tx_id = $tx; rx_id = (RxFor $tx); ext = $false; data = '3E 00'; p2star_ms = 500 } | ConvertTo-Json -Compress) "$script:WiCAN/api/uds/request" } catch {} }
}

function Invoke-Uds([string]$tx, [string]$data, [string]$rx = $null, [int]$retries = 1, [int]$p2star = 3000, [switch]$NoWake) {
    Assert-ReadOnly $data
    $ext = $tx.Length -gt 3   # 29-bit IDs (e.g. 18DA10F1) are 8 hex digits
    if (-not $rx) { $rx = $(if ($ext) { '18DAF1' + $tx.Substring(4, 2) } else { RxFor $tx }) }
    $body = @{ tx_id = $tx; rx_id = $rx; ext = $ext; data = $data; p2star_ms = $p2star } | ConvertTo-Json -Compress
    for ($i = 0; $i -le $retries; $i++) {
        if ($i -gt 0 -and -not $NoWake -and $tx -ne '7DF') { Wake-Bus $tx }
        try {
            $r = Invoke-RestMethod -TimeoutSec ([Math]::Max(15, [int]($p2star / 1000) + 10)) -Method Post -ContentType 'application/json' -Body $body "$script:WiCAN/api/uds/request"
            if ($r.ok) { return $r }
        } catch { $r = [pscustomobject]@{ ok = $false; error = $_.Exception.Message } }
    }
    return $r
}

# Run a scriptblock over many inputs in parallel. The block receives one item ($args[0]) and the helper path ($args[1]).
function Invoke-Parallel($items, [scriptblock]$block, [int]$threads = 4, [string]$ProgressFile = $null) {
    $pool = [runspacefactory]::CreateRunspacePool(1, $threads); $pool.Open()
    $helper = Join-Path $PSScriptRoot 'wican.ps1'
    $jobs = foreach ($it in $items) {
        $ps = [powershell]::Create(); $ps.RunspacePool = $pool
        [void]$ps.AddScript(". '$helper'`n" + $block.ToString()).AddArgument($it)
        [pscustomobject]@{ ps = $ps; h = $ps.BeginInvoke(); item = $it }
    }
    if ($ProgressFile) {
        # Write progress (items done, item in flight, results so far) while the jobs run
        $started = (Get-Date).ToString('s')
        while ($true) {
            $done = @($jobs | Where-Object { $_.h.IsCompleted }); $pending = @($jobs | Where-Object { -not $_.h.IsCompleted })
            $p = [ordered]@{ state = $(if ($pending) { 'running' } else { 'done' }); started = $started; checked = $done.Count; total = $jobs.Count
                current = $(if ($pending) { $pending[0].item } else { $null }) }
            try { [IO.File]::WriteAllText("$ProgressFile.tmp", ($p | ConvertTo-Json -Compress)); Move-Item -Force "$ProgressFile.tmp" $ProgressFile } catch {}
            if (-not $pending) { break }
            Start-Sleep -Milliseconds 700
        }
    }
    $out = foreach ($j in $jobs) { $j.ps.EndInvoke($j.h); $j.ps.Dispose() }
    $pool.Close(); $pool.Dispose()
    $out
}

# Common Ford 11-bit module addresses (request ID). Names marked ? are less certain.
$script:ModuleNames = @{
    '7E0'='PCM - Powertrain Control'; '7E1'='TCM - Transmission Control'; '760'='ABS - Anti-lock Brakes';
    '730'='PSCM - Power Steering'; '737'='RCM - Restraints (airbags)'; '726'='BCM - Body Control';
    '720'='IPC - Instrument Cluster'; '716'='GWM - Gateway'; '7D0'='APIM - SYNC Infotainment';
    '727'='ACM - Audio Control'; '724'='SCCM - Steering Column'; '733'='HVAC - Climate Control';
    '764'='CCM - Cruise Control Radar'; '706'='IPMA - Camera / Lane Assist'; '754'='TCU - Telematics Modem';
    '740'='DDM - Driver Door'; '741'='PDM - Passenger Door'; '736'='PAM - Parking Aid'; '703'='AWDM - All-Wheel Drive'; '751'='RTM - Radio Transceiver (TPMS) ?';
    '7A7'='FCIM - Front Controls Interface ?'; '765'='OCS - Occupant Classification ?'; '7C4'='SODL - Blind Spot Left ?'; '7C6'='SODR - Blind Spot Right ?'
}

$script:DidNames = @{
    'F110'='ECU diagnostic identification ?'; 'F111'='ECU core assembly number'; 'F113'='ECU delivery assembly number';
    'F124'='ECU calibration data #1 number'; 'F125'='ECU calibration data #2 number';
    'F162'='Software download specification version'; 'F163'='Diagnostic specification version';
    'F180'='Boot software identification'; 'F181'='Application software identification'; 'F182'='Application data identification';
    'F183'='Boot software fingerprint'; 'F184'='Application software fingerprint'; 'F185'='Application data fingerprint';
    'F186'='Active diagnostic session'; 'F187'='Spare part number'; 'F188'='ECU software number';
    'F189'='ECU software version'; 'F18A'='System supplier identifier'; 'F18B'='ECU manufacturing date';
    'F18C'='ECU serial number'; 'F18D'='Supported functional units'; 'F18E'='Vehicle manufacturer kit assembly part number';
    'F190'='VIN'; 'F191'='ECU hardware number'; 'F192'='Supplier ECU hardware number'; 'F193'='Supplier ECU hardware version';
    'F194'='Supplier ECU software number'; 'F195'='Supplier ECU software version'; 'F196'='Exhaust regulation / type approval number';
    'F197'='System name or engine type'; 'F198'='Repair shop code / tester serial'; 'F199'='Programming date';
    'F19D'='ECU installation date'; 'F19E'='ODX file'; 'D100'='Active diagnostic session (Ford)'; 'DD01'='Total distance / odometer (Ford)'
}
function Get-DidName([string]$did) {
    if ($script:DidNames.ContainsKey($did)) { return $script:DidNames[$did] }
    if ($did -match '^DE[0-9A-F]{2}$') { return 'As-built configuration block' }
    if ($did -match '^F4[0-9A-F]{2}$') { return "OBD mode 01 PID 0x$($did.Substring(2)) (mirror)" }
    ''
}

function Get-NrcName([int]$n) {
    switch ($n) { 0x10 {'generalReject'} 0x11 {'serviceNotSupported'} 0x12 {'subFunctionNotSupported'} 0x13 {'incorrectMessageLength'}
        0x14 {'responseTooLong'} 0x22 {'conditionsNotCorrect'} 0x31 {'requestOutOfRange'} 0x33 {'securityAccessDenied'}
        0x7E {'subFunctionNotSupportedInActiveSession'} 0x7F {'serviceNotSupportedInActiveSession'} default {'0x{0:X2}' -f $n} }
}

# Decode one OBDb signal from the data bytes that follow the DID echo.
# Bits are numbered MSB-first from the first data byte. value = raw * mul / div + add.
function Convert-Signal([byte[]]$data, $fmt) {
    $fmt = (Get-NativeFmt $fmt).fmt   # always report the module's native unit
    $bix = 0; if ($null -ne $fmt.bix) { $bix = [int]$fmt.bix }
    $len = [int]$fmt.len
    if ($bix + $len -gt $data.Length * 8) { return [ordered]@{ value = $null; display = '(response too short)' } }
    [uint64]$raw = 0
    for ($i = 0; $i -lt $len; $i++) {
        $bit = $bix + $i
        $raw = ($raw -shl 1) -bor (($data[[int][Math]::Floor($bit / 8)] -shr (7 - ($bit % 8))) -band 1)
    }
    if ($fmt.map) {
        $m = $fmt.map.PSObject.Properties | Where-Object { $_.Name -eq "$raw" } | Select-Object -First 1
        $d = $(if ($m) { $m.Value.description } else { "unknown ($raw)" })
        return [ordered]@{ value = $(if ($m) { $m.Value.value } else { $raw }); display = $d; raw = $raw }
    }
    [double]$v = $raw
    if ($fmt.sign -and $len -lt 64 -and ($raw -band ([uint64]1 -shl ($len - 1)))) { $v = [double]$raw - [Math]::Pow(2, $len) }
    if ($fmt.mul) { $v *= [double]$fmt.mul }
    if ($fmt.div) { $v /= [double]$fmt.div }
    if ($fmt.add) { $v += [double]$fmt.add }
    if (($null -ne $fmt.nullmax -and $v -ge [double]$fmt.nullmax) -or ($null -ne $fmt.nullmin -and $v -le [double]$fmt.nullmin)) {
        return [ordered]@{ value = $null; display = 'not available'; raw = $raw }
    }
    $v = [Math]::Round($v, 4)
    $u = "$($fmt.unit)"
    $disp = switch ($u) {
        'offon'   { if ($v) { 'on' } else { 'off' } }
        'noyes'   { if ($v) { 'yes' } else { 'no' } }
        'yesno'   { if ($v) { 'no' } else { 'yes' } }
        'celsius' { "$v $([char]0xB0)C" } 'percent' { "$v %" } 'volts' { "$v V" } 'kilometers' { "$v km" } 'kilometersPerHour' { "$v km/h" }
        'psi' { "$v psi" } 'kilopascal' { "$v kPa" } 'rpm' { "$v rpm" } 'seconds' { "$v s" } 'minutes' { "$v min" } 'amps' { "$v A" }
        'liters' { "$v L" } 'kpa' { "$v kPa" } 'newtonmeters' { "$v Nm" } 'milliamps' { "$v mA" } 'milliseconds' { "$v ms" } 'degrees' { "$v$([char]0xB0)" } 'meters' { "$v m" } 'hours' { "$v h" } 'days' { "$v days" }
        default { if ($u -and $u -ne 'scalar' -and $u -ne 'unknown') { "$v $u" } else { "$v" } }
    }
    [ordered]@{ value = $v; display = $disp; raw = $raw; unit = $u }
}

# Evaluate a WiCAN profile expression against the data bytes after the DID echo.
# WiCAN numbering for mode 22: B4 = first data byte, [B4:B5] = big-endian 16-bit. Torque-style A..D = data bytes 0..3.
function Convert-WicanExpr([byte[]]$data, [string]$expr) {
    $e = $expr -replace '\\', ''
    $need = 0
    foreach ($m in [regex]::Matches($e, 'B(\d+)')) { $need = [Math]::Max($need, [int]$m.Groups[1].Value - 3) }
    foreach ($m in [regex]::Matches($e, '\b([A-D])\b')) { $need = [Math]::Max($need, [int][char]$m.Groups[1].Value - 64) }
    if ($need -gt $data.Length) { throw "expression needs $need data byte(s), the module returned $($data.Length)" }
    $e = [regex]::Replace($e, '\[B(\d+):B(\d+)\]', { param($m)
        $v = [uint64]0; for ($i = [int]$m.Groups[1].Value; $i -le [int]$m.Groups[2].Value; $i++) { $v = $v * 256 + $data[$i - 4] }; "$v" })
    $e = [regex]::Replace($e, 'B(\d+)', { param($m) "$($data[[int]$m.Groups[1].Value - 4])" })
    $e = [regex]::Replace($e, '\b([A-D])\b', { param($m) "$($data[[int][char]$m.Groups[1].Value - 65])" })
    $e = $e -replace '>>', ' -shr ' -replace '<<', ' -shl ' -replace '&', ' -band ' -replace '\|', ' -bor '
    if ($e -notmatch '^[0-9\.\s\+\-\*/\(\)]*(-(shr|shl|band|bor)[0-9\.\s\+\-\*/\(\)]*)*$') { throw "unsafe expression: $expr" }
    [Math]::Round([double](Invoke-Expression $e), 4)
}

# Evaluate a Torque-style formula (A = first data byte after the DID echo, B = second, ...).
# Supports Signed(X), {X:n} (bit n of byte X), >> << & |. With -Signed, the most significant byte
# used is read as two's complement, which makes A, (A*256)+B, etc. signed. Plain arithmetic only.
function Convert-TorqueExpr([byte[]]$data, [string]$formula, [bool]$Signed = $false) {
    $e = $formula -replace '\s+', ' '
    $letters = @([regex]::Matches($e, '(?<![A-Za-z])([A-Z])(?![A-Za-z(])') | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique)
    $msb = $(if ($letters) { $letters[0] } else { $null })
    $byteVal = { param($L) $i = [int][char]$L - 65; if ($i -ge $data.Length) { throw "formula needs byte $L, response has $($data.Length)" }; [int]$data[$i] }
    $e = [regex]::Replace($e, '\{([A-Z]):(\d+)\}', { param($m) "(($(& $byteVal $m.Groups[1].Value) -shr $($m.Groups[2].Value)) -band 1)" })
    $e = [regex]::Replace($e, '(?i)signed\(\s*([A-Z])\s*\)', { param($m) $v = & $byteVal $m.Groups[1].Value; if ($v -gt 127) { "($($v - 256))" } else { "$v" } })
    $e = [regex]::Replace($e, '(?<![A-Za-z])([A-Z])(?![A-Za-z(])', { param($m)
        $v = & $byteVal $m.Groups[1].Value
        if ($Signed -and $m.Groups[1].Value -eq $msb -and $v -gt 127) { "($($v - 256))" } else { "$v" } })
    $e = $e -replace '>>', ' -shr ' -replace '<<', ' -shl ' -replace '&', ' -band ' -replace '\|', ' -bor '
    if ($e -notmatch '^[0-9\.\s\+\-\*/\(\)]*(-(shr|shl|band|bor)[0-9\.\s\+\-\*/\(\)]*)*$') { throw "unsupported formula: $formula" }
    [Math]::Round([double](Invoke-Expression $e), 4)
}

# ---- Native units (user rule: report what the module's own scaling yields; HA converts) ----------
# Per-DID native formulas that override every source. Torque-style (A = first data byte).
$script:NativeOverrides = @{
    '726:2813' = @{ formula = '((A*256)+B)/10'; unit = 'inHg'; wican = '[B4:B5]/10'; nullraw = 3000; note = "Ford native kPa (openRS definition); OBDb's /20 psi and the /10 inHg variant are conversions of this" }
    '726:2814' = @{ formula = '((A*256)+B)/10'; unit = 'inHg'; wican = '[B4:B5]/10'; nullraw = 3000; note = 'Ford native 0.1 inHg per step' }
    '726:2815' = @{ formula = '((A*256)+B)/10'; unit = 'inHg'; wican = '[B4:B5]/10'; nullraw = 3000; note = 'Ford native 0.1 inHg per step' }
    '726:2816' = @{ formula = '((A*256)+B)/10'; unit = 'inHg'; wican = '[B4:B5]/10'; nullraw = 3000; note = 'Ford native 0.1 inHg per step' }
    '726:2817' = @{ formula = '((A*256)+B)/10'; unit = 'inHg'; wican = '[B4:B5]/10'; nullraw = 3000; note = 'Ford native 0.1 inHg per step' }
    '726:2818' = @{ formula = '((A*256)+B)/10'; unit = 'inHg'; wican = '[B4:B5]/10'; nullraw = 3000; note = 'Ford native 0.1 inHg per step' }
    '726:2827' = @{ formula = 'A'; unit = 'psi'; wican = 'B4'; note = 'one byte of whole psi (57 front on this van): the module stores psi' }
    '726:2828' = @{ formula = 'A'; unit = 'psi'; wican = 'B4'; note = 'one byte of whole psi (75 rear on this van): the module stores psi' }
}

# Imperial units that a scaled formula converted from metric: factor/offset back to the metric unit.
$script:ToMetric = @{
    'psi'        = @{ unit = 'kPa';  f = 6.894757; o = 0 }
    'inhg'       = @{ unit = 'kPa';  f = 3.386389; o = 0 }
    'fahrenheit' = @{ unit = 'celsius'; f = (1/1.8); o = (-32/1.8) }
    'miles'      = @{ unit = 'kilometers'; f = 1.609344; o = 0 }
    'mph'        = @{ unit = 'kilometersPerHour'; f = 1.609344; o = 0 }
    'gallons'    = @{ unit = 'liters'; f = 3.785412; o = 0 }
}

# Return the native form of an OBDb fmt: a copy whose mul/div/add produce the module's own (metric) unit.
# Only scaled imperial signals are converted (a raw, unscaled imperial value is what the module stores).
function Get-NativeFmt($fmt) {
    $u = "$($fmt.unit)".ToLower()
    if (-not $script:ToMetric.ContainsKey($u) -or -not ($fmt.mul -or $fmt.div)) { return @{ fmt = $fmt; note = $null } }
    $c = $script:ToMetric[$u]
    $k = 1.0; if ($fmt.mul) { $k *= [double]$fmt.mul }; if ($fmt.div) { $k /= [double]$fmt.div }
    $a = 0.0; if ($fmt.add) { $a = [double]$fmt.add }
    $n = [ordered]@{}; foreach ($p in $fmt.PSObject.Properties) { $n[$p.Name] = $p.Value }
    $n.Remove('mul'); $n.Remove('div'); $n.Remove('add'); $n.Remove('min'); $n.Remove('max'); $n.Remove('nullmin'); $n.Remove('nullmax')
    $n.mul = [Math]::Round($k * $c.f, 9); $a2 = $a * $c.f + $c.o; if ([Math]::Abs($a2) -gt 1e-9) { $n.add = [Math]::Round($a2, 6) }
    $n.unit = $c.unit
    @{ fmt = [pscustomobject]$n; note = "converted back from the source's $($fmt.unit) to the module's native $($c.unit)" }
}

function HexToBytes([string]$hex) { [byte[]]@($hex -split ' ' | Where-Object { $_ } | ForEach-Object { [Convert]::ToByte($_, 16) }) }

function Hex2Ascii([string]$hex) {
    $b = $hex -split ' ' | Where-Object { $_ } | ForEach-Object { [Convert]::ToByte($_,16) }
    -join ($b | Where-Object { $_ -ge 0x20 -and $_ -lt 0x7F } | ForEach-Object { [char]$_ })
}
