# Read-only sweep of one module: DTCs, then every DID in priority order.
# Writes data\mod_<TX>_<session>.json and .js (for the live preview) as it goes.
param(
    [Parameter(Mandatory)][string]$Tx,
    [int]$Batch = 3,
    [ValidateSet('default','extended')][string]$Session = 'default',
    [double]$MinVolts = 12.0,
    [switch]$Resume,        # continue from the saved progress in data\mod_<TX>_<session>.json
    [switch]$SkipDtc
)
. (Join-Path $PSScriptRoot 'wican.ps1')
$dataDir = Join-Path $PSScriptRoot 'data'; New-Item -ItemType Directory -Force $dataDir | Out-Null
$key = "$($Tx)_$Session"
$jsonPath = Join-Path $dataDir "mod_$key.json"; $jsPath = Join-Path $dataDir "mod_$key.js"

# Priority order: identification, Ford global/config, common Ford module ranges, then everything else.
$ranges = @(@(0xF100,0xF1FF),@(0xD100,0xD1FF),@(0xDD00,0xDEFF),@(0xF400,0xF4FF),@(0x4000,0x4FFF),
            @(0xD000,0xD0FF),@(0xD200,0xDCFF),@(0xDF00,0xF0FF),@(0xF200,0xF3FF),@(0xF500,0xFFFF),
            @(0x0000,0x3FFF),@(0x5000,0xCFFF))
$total = ($ranges | ForEach-Object { $_[1] - $_[0] + 1 } | Measure-Object -Sum).Sum

$mod = [ordered]@{
    tx = $Tx; rx = (RxFor $Tx); name = $script:ModuleNames[$Tx]; session = $Session
    state = 'starting'; started = (Get-Date).ToString('s'); updated = $null
    progress = [ordered]@{ checked = 0; total = $total; requests = 0; current = '' }
    volts = $null; batch = $Batch; dtcs = @(); dtc_raw = [ordered]@{}; dids = [ordered]@{}; notes = @()
}

$skip = 0
if ($Resume -and (Test-Path $jsonPath)) {
    $old = Get-Content -Raw $jsonPath | ConvertFrom-Json
    $skip = [int]$old.progress.checked
    $mod.started = $old.started; $mod.progress.checked = $skip; $mod.progress.requests = [int]$old.progress.requests
    foreach ($p in $old.dids.PSObject.Properties) { $mod.dids[$p.Name] = [ordered]@{ name = $p.Value.name; status = $p.Value.status; len = $p.Value.len; hex = $p.Value.hex; ascii = $p.Value.ascii } }
    foreach ($p in $old.dtc_raw.PSObject.Properties) { $mod.dtc_raw[$p.Name] = $p.Value }
    foreach ($x in @($old.dtcs)) { if ($x) { $mod.dtcs += ,[ordered]@{ dtc = $x.dtc; status = $x.status; raw = $x.raw } } }
    $mod.notes = @($old.notes) + "resumed at $skip"
    $SkipDtc = $true
}

function Save {
    $mod.updated = (Get-Date).ToString('s')
    $json = $mod | ConvertTo-Json -Depth 8 -Compress
    [IO.File]::WriteAllText("$jsonPath.tmp", $json); Move-Item -Force "$jsonPath.tmp" $jsonPath
    [IO.File]::WriteAllText("$jsPath.tmp", "window.MODS=window.MODS||{};window.MODS['$key']=$json;"); Move-Item -Force "$jsPath.tmp" $jsPath
}

function Record([string]$did, $r) {
    if ($r.ok -and $r.positive) {
        $bytes = $r.response -split ' '
        $data = ($bytes[3..($bytes.Length-1)] -join ' ')
        $ascii = Hex2Ascii $data
        $isText = ($bytes.Length -gt 5) -and ($ascii.Length -ge [Math]::Max(3, ($bytes.Length - 3) * 0.5))
        $mod.dids[$did] = [ordered]@{ name = (Get-DidName $did); status = 'ok'; len = $bytes.Length - 3; hex = $data; ascii = $(if ($isText) { $ascii.Trim() } else { $null }) }
    } elseif ($r.ok -and $r.nrc -and $r.nrc -ne 0x31) {
        $mod.dids[$did] = [ordered]@{ name = (Get-DidName $did); status = (Get-NrcName $r.nrc); len = 0; hex = $null; ascii = $null }
    }
}

# Session setup
if ($Session -eq 'extended') {
    $r = Invoke-Uds $Tx '10 03'
    if (-not ($r.ok -and $r.positive)) { $mod.state = 'extended session refused'; $mod.notes += "10 03 => $($r.response) $($r.error)"; Save; return }
    $lastTp = Get-Date
} else { $lastTp = Get-Date }

# DTCs: status mask FF, supported DTCs (0x0A)
if (-not $SkipDtc) { $mod.state = 'reading DTCs'; Save }
foreach ($q in $(if ($SkipDtc) { @() } else { '19 02 FF','19 0A' })) {
    $r = Invoke-Uds $Tx $q
    $mod.dtc_raw[$q] = $(if ($r.ok) { $r.response } else { "ERR $($r.error)" })
    if ($q -eq '19 02 FF' -and $r.ok -and $r.positive) {
        $b = $r.response -split ' '
        for ($i = 3; $i + 3 -lt $b.Length; $i += 4) {
            $code = [Convert]::ToInt32($b[$i],16); $letter = 'PCBU'[($code -shr 6) -band 3]
            $dtc = '{0}{1:X1}{2:X1}{3}-{4}' -f $letter, (($code -shr 4) -band 3), ($code -band 0xF), $b[$i+1], $b[$i+2]
            $mod.dtcs += ,[ordered]@{ dtc = $dtc; status = $b[$i+3]; raw = ($b[$i..($i+3)] -join ' ') }
        }
    }
}

# DID sweep
$mod.state = 'scanning DIDs'; Save
$sinceSave = 0
foreach ($rg in $ranges) {
    $size = $rg[1] - $rg[0] + 1
    if ($skip -ge $size) { $skip -= $size; continue }
    $d = $rg[0] + $skip; $skip = 0
    while ($d -le $rg[1]) {
        # Re-enter extended session now and then in case the module dropped back to default.
        if ($Session -eq 'extended' -and ($mod.progress.requests % 200) -eq 0) { $null = Invoke-Uds $Tx '10 03' -retries 1 }
        $n = [Math]::Min($Batch, $rg[1] - $d + 1)
        $dids = 0..($n-1) | ForEach-Object { '{0:X4}' -f ($d + $_) }
        $req = '22 ' + (($dids | ForEach-Object { $_.Substring(0,2) + ' ' + $_.Substring(2,2) }) -join ' ')
        $r = Invoke-Uds $Tx $req -retries 2
        $mod.progress.requests++
        if (-not $r.ok) { $mod.notes += "timeout at $($dids[0])"; if ($mod.notes.Count -gt 50) { $mod.state = 'stopped: module stopped answering'; Save; return } }
        elseif ($r.positive -or $r.nrc -ne 0x31) {
            if ($r.nrc -eq 0x13 -and $Batch -gt 1) { $Batch--; $mod.batch = $Batch; continue }  # too many DIDs: shrink and retry
            if ($n -eq 1) { Record $dids[0] $r }
            else { foreach ($one in $dids) { Record $one (Invoke-Uds $Tx ('22 ' + $one.Substring(0,2) + ' ' + $one.Substring(2,2)) -retries 2); $mod.progress.requests++ } }
        }
        $d += $n; $mod.progress.checked += $n; $mod.progress.current = '{0:X4}' -f $d; $sinceSave++
        if ($Session -eq 'extended' -and ((Get-Date) - $lastTp).TotalSeconds -gt 2) { $null = Invoke-Uds $Tx '3E 00' -retries 0; $lastTp = Get-Date }
        if ($sinceSave -ge 40) {
            $sinceSave = 0
            try { $mod.volts = (Invoke-RestMethod -TimeoutSec 5 "$script:WiCAN/api/battery").voltage } catch {}
            Save
            if ($mod.volts -and $mod.volts -lt $MinVolts) { $mod.state = "stopped: battery $($mod.volts) V below $MinVolts V"; Save; return }
        }
    }
}
if ($Session -eq 'extended') { $null = Invoke-Uds $Tx '10 01' }
$mod.state = 'done'; Save
