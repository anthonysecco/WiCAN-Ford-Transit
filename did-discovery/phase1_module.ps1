# Phase 1 for one module: identification, active DTCs, every known Ford DID for this module (decoded),
# Ford global DIDs, and (PCM only) standard OBD mode 01 / 09. Read-only.
param([Parameter(Mandatory)][string]$Tx, [double]$MinVolts = 11.9)
. (Join-Path $PSScriptRoot 'wican.ps1')
$dataDir = Join-Path $PSScriptRoot 'data'
$key = "$($Tx)_phase1"
$jsonPath = Join-Path $dataDir "mod_$key.json"; $jsPath = Join-Path $dataDir "mod_$key.js"
$L = (Get-Content -Raw -Encoding UTF8 (Join-Path $PSScriptRoot 'refs\ford_did_library.json') | ConvertFrom-Json).entries
Wake-Bus $Tx

$idDids = 'F110','F111','F113','F124','F125','F162','F163','F180','F181','F182','F187','F188','F189','F18A','F18B','F18C','F190','F191','F192','F193','F194','F195','F197','F199'
$globalDids = 'D100','DD00','DD01','DD02','DD04','DD05','DD06','DD09','DD0A'
$libEntries = @($L.PSObject.Properties | Where-Object { $_.Value.hdr -eq $Tx -or ($Tx -eq '7E0' -and $_.Value.hdr -eq '7DF') } | ForEach-Object { $_.Value })
$libDids = @($libEntries | ForEach-Object { $_.did } | Sort-Object -Unique)
$allDids = @($idDids + $globalDids + $libDids | Select-Object -Unique)
$obdPids = @(); if ($Tx -eq '7E0') { $obdPids = 1 }

$mod = [ordered]@{
    tx = $Tx; rx = (RxFor $Tx); name = $script:ModuleNames[$Tx]; session = 'phase1'; state = 'starting'
    started = (Get-Date).ToString('s'); updated = $null
    progress = [ordered]@{ checked = 0; total = $allDids.Count; requests = 0; current = '' }
    volts = $null; library_dids = $libDids.Count; dtcs = @(); dtc_raw = [ordered]@{}; dids = [ordered]@{}; signals = @(); obd = @(); notes = @()
}
function Save {
    $mod.updated = (Get-Date).ToString('s'); $json = $mod | ConvertTo-Json -Depth 8 -Compress
    [IO.File]::WriteAllText("$jsonPath.tmp", $json); Move-Item -Force "$jsonPath.tmp" $jsonPath
    [IO.File]::WriteAllText("$jsPath.tmp", "window.MODS=window.MODS||{};window.MODS['$key']=$json;"); Move-Item -Force "$jsPath.tmp" $jsPath
}
function Volts { try { (Invoke-RestMethod -TimeoutSec 5 "$script:WiCAN/api/battery").voltage } catch { $null } }

# DTCs that are active or stored (skip "not tested this cycle", which can be hundreds)
$mod.state = 'reading DTCs'; Save
foreach ($q in '19 01 AF','19 02 AF') {
    $r = Invoke-Uds $Tx $q -retries 1 -p2star 10000
    $mod.dtc_raw[$q] = $(if ($r.ok) { $r.response } else { "ERR $($r.error)" })
}
$list = $mod.dtc_raw['19 02 AF']
if ($list -and $list.StartsWith('59')) {
    $b = $list -split ' '
    for ($i = 3; $i + 3 -lt $b.Length; $i += 4) {
        $code = [Convert]::ToInt32($b[$i],16)
        $mod.dtcs += ,[ordered]@{ dtc = ('{0}{1:X1}{2:X1}{3}-{4}' -f 'PCBU'[($code -shr 6) -band 3], (($code -shr 4) -band 3), ($code -band 0xF), $b[$i+1], $b[$i+2]); status = $b[$i+3]; raw = ($b[$i..($i+3)] -join ' ') }
    }
}

# Known DIDs
$mod.state = 'reading known DIDs'; Save
$n = 0
foreach ($did in $allDids) {
    $r = Invoke-Uds $Tx ('22 ' + $did.Substring(0,2) + ' ' + $did.Substring(2,2)) -retries 1
    $mod.progress.requests++; $mod.progress.checked++; $mod.progress.current = $did
    $entry = $libEntries | Where-Object { $_.did -eq $did } | Select-Object -First 1
    if ($r.ok -and $r.positive) {
        $bytes = $r.response -split ' '; $data = ($bytes[3..($bytes.Length-1)] -join ' ')
        $ascii = Hex2Ascii $data; $isText = ($bytes.Length -gt 5) -and ($ascii.Length -ge [Math]::Max(3, ($bytes.Length - 3) * 0.5))
        $mod.dids[$did] = [ordered]@{ name = $(if ($entry) { ($entry.signals | ForEach-Object { $_.name }) -join '; ' } else { Get-DidName $did }); status = 'ok'; len = $bytes.Length - 3; hex = $data; ascii = $(if ($isText) { $ascii.Trim() } else { $null }); source = $(if ($entry) { $entry.defined_by } else { $null }) }
        if ($entry) {
            $db = HexToBytes $data
            foreach ($s in @($entry.signals | Where-Object { $_ })) {
                $v = Convert-Signal $db $s.fmt
                $mod.signals += ,[ordered]@{ did = $did; id = $s.id; name = $s.name; path = $s.path; display = $v.display; value = $v.value; unit = "$($s.fmt.unit)"; source = 'OBDb ' + $entry.defined_by }
            }
            foreach ($s in @($entry.repo_signals | Where-Object { $_ })) {
                try { $val = Convert-WicanExpr $db $s.expr; $disp = ("$val $($s.unit)").Trim() } catch { $val = $null; $disp = "(expr error: $($s.expr))" }
                $mod.signals += ,[ordered]@{ did = $did; id = $s.id; name = $s.name; path = 'Your PIDs.md'; display = $disp; value = $val; unit = $s.unit; source = "WiCAN-Ford-Transit ($($s.repo_status))" }
            }
        }
    } elseif ($r.ok -and $r.nrc -ne 0x31) {
        $mod.dids[$did] = [ordered]@{ name = $(if ($entry) { ($entry.signals | ForEach-Object { $_.name }) -join '; ' } else { Get-DidName $did }); status = (Get-NrcName $r.nrc); len = 0; hex = $null; ascii = $null; source = $(if ($entry) { $entry.defined_by } else { $null }) }
    } elseif (-not $r.ok) { $mod.notes += "timeout $did" }
    if ((++$n % 25) -eq 0) {
        $mod.volts = Volts; Save
        if ($mod.volts -and $mod.volts -lt $MinVolts) {
            Start-Sleep 3; $mod.volts = Volts   # confirm: ignore brief dips (fuel pump, fans)
            if ($mod.volts -and $mod.volts -lt $MinVolts) { $mod.state = "stopped: battery $($mod.volts) V"; Save; return }
        }
    }
}

# Standard OBD (PCM only): supported PIDs, then decode the common ones
if ($obdPids) {
    $mod.state = 'reading OBD mode 01'; Save
    $std = @{
        '04'=@('Calculated engine load','%',{param($a) $a[0]*100/255}); '05'=@('Engine coolant temperature','C',{param($a) $a[0]-40})
        '06'=@('Short term fuel trim bank 1','%',{param($a) ($a[0]-128)*100/128}); '07'=@('Long term fuel trim bank 1','%',{param($a) ($a[0]-128)*100/128})
        '08'=@('Short term fuel trim bank 2','%',{param($a) ($a[0]-128)*100/128}); '09'=@('Long term fuel trim bank 2','%',{param($a) ($a[0]-128)*100/128})
        '0B'=@('Intake manifold pressure','kPa',{param($a) $a[0]}); '0C'=@('Engine speed','rpm',{param($a) (256*$a[0]+$a[1])/4})
        '0D'=@('Vehicle speed','km/h',{param($a) $a[0]}); '0E'=@('Timing advance','deg',{param($a) $a[0]/2-64})
        '0F'=@('Intake air temperature','C',{param($a) $a[0]-40}); '10'=@('Mass air flow','g/s',{param($a) (256*$a[0]+$a[1])/100})
        '11'=@('Throttle position','%',{param($a) $a[0]*100/255}); '1C'=@('OBD standard','',{param($a) $a[0]})
        '1F'=@('Run time since engine start','s',{param($a) 256*$a[0]+$a[1]}); '21'=@('Distance with MIL on','km',{param($a) 256*$a[0]+$a[1]})
        '2F'=@('Fuel tank level','%',{param($a) $a[0]*100/255}); '30'=@('Warm-ups since codes cleared','',{param($a) $a[0]})
        '31'=@('Distance since codes cleared','km',{param($a) 256*$a[0]+$a[1]}); '33'=@('Barometric pressure','kPa',{param($a) $a[0]})
        '3C'=@('Catalyst temperature B1S1','C',{param($a) (256*$a[0]+$a[1])/10-40}); '42'=@('Control module voltage','V',{param($a) (256*$a[0]+$a[1])/1000})
        '43'=@('Absolute load','%',{param($a) (256*$a[0]+$a[1])*100/255}); '45'=@('Relative throttle position','%',{param($a) $a[0]*100/255})
        '46'=@('Ambient air temperature','C',{param($a) $a[0]-40}); '49'=@('Accelerator pedal position D','%',{param($a) $a[0]*100/255})
        '4A'=@('Accelerator pedal position E','%',{param($a) $a[0]*100/255}); '4C'=@('Commanded throttle actuator','%',{param($a) $a[0]*100/255})
        '51'=@('Fuel type','',{param($a) $a[0]}); '5C'=@('Engine oil temperature','C',{param($a) $a[0]-40})
        '5E'=@('Engine fuel rate','L/h',{param($a) (256*$a[0]+$a[1])/20}); 'A6'=@('Odometer','km',{param($a) ([double]$a[0]*16777216+$a[1]*65536+$a[2]*256+$a[3])/10})
    }
    $supported = @()
    foreach ($base in 0x00,0x20,0x40,0x60,0x80,0xA0,0xC0) {
        $r = Invoke-Uds $Tx ('01 {0:X2}' -f $base) -retries 1; $mod.progress.requests++
        if (-not ($r.ok -and $r.positive)) { break }
        $bb = HexToBytes (($r.response -split ' ' | Select-Object -Skip 2) -join ' ')
        for ($i = 0; $i -lt 32; $i++) { if ($bb[[int][Math]::Floor($i/8)] -band (0x80 -shr ($i % 8))) { $supported += ('{0:X2}' -f ($base + $i + 1)) } }
        if (-not ($bb[3] -band 1)) { break }
    }
    $mod.notes += "OBD mode 01 supported: $($supported -join ' ')"
    foreach ($obdPid in $supported) {   # note: $pid is a read-only automatic variable in PowerShell
        if ($obdPid -match '^(00|20|40|60|80|A0|C0)$') { continue }
        $r = Invoke-Uds $Tx "01 $obdPid" -retries 1; $mod.progress.requests++
        if (-not ($r.ok -and $r.positive)) { continue }
        $data = ($r.response -split ' ' | Select-Object -Skip 2) -join ' '
        $o = [ordered]@{ pid = $obdPid; name = $null; display = $null; hex = $data }
        if ($std.ContainsKey($obdPid)) {
            $d = $std[$obdPid]; $val = [Math]::Round((& $d[2] ([int[]](HexToBytes $data))), 2)
            $u = $d[1]; if ($u -eq 'C') { $u = "$([char]0xB0)C" }
            $o.name = $d[0]; $o.display = ("$val $u").Trim()
        }
        $mod.obd += ,$o
    }
    foreach ($q in '09 02','09 04','09 06','09 0A') {
        $r = Invoke-Uds $Tx $q -retries 1; $mod.progress.requests++
        if ($r.ok -and $r.positive) { $mod.obd += ,[ordered]@{ pid = "M$q"; name = @{ '09 02'='VIN'; '09 04'='Calibration IDs'; '09 06'='Calibration verification numbers'; '09 0A'='ECU name' }[$q]; display = (Hex2Ascii ((($r.response -split ' ') | Select-Object -Skip 3) -join ' ')); hex = $r.response } }
    }
}

$mod.volts = Volts
$mod.state = 'done'; Save
