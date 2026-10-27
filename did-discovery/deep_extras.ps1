# Extra read-only passes for one module:
#   -Part dtc  : every DTC report (count, list, supported, snapshots, extended data)
#   -Part dids : scaling info (0x24) and repeated sampling of every DID found so far (live vs fixed)
param([Parameter(Mandatory)][string]$Tx, [ValidateSet('dtc','dids')][string]$Part, [int]$Samples = 6, [int]$SpacingSec = 10, [double]$MinVolts = 12.0)
. (Join-Path $PSScriptRoot 'wican.ps1')
$dataDir = Join-Path $PSScriptRoot 'data'
$jsonPath = Join-Path $dataDir "extra_$Tx.json"; $jsPath = Join-Path $dataDir "extra_$Tx.js"

$x = [ordered]@{ tx = $Tx; state = ''; updated = $null; dtc_reports = [ordered]@{}; dtc_detail = [ordered]@{}; scaling = [ordered]@{}; samples = [ordered]@{}; dynamic = [ordered]@{} }
if (Test-Path $jsonPath) {
    $old = Get-Content -Raw $jsonPath | ConvertFrom-Json
    foreach ($k in 'dtc_reports','dtc_detail','scaling','samples','dynamic') { foreach ($p in $old.$k.PSObject.Properties) { $x[$k][$p.Name] = $p.Value } }
}
function Save {
    $x.updated = (Get-Date).ToString('s'); $json = $x | ConvertTo-Json -Depth 8 -Compress
    [IO.File]::WriteAllText("$jsonPath.tmp", $json); Move-Item -Force "$jsonPath.tmp" $jsonPath
    [IO.File]::WriteAllText("$jsPath.tmp", "window.EXTRA=window.EXTRA||{};window.EXTRA['$Tx']=$json;"); Move-Item -Force "$jsPath.tmp" $jsPath
}
function Resp($r) { if ($r.ok) { $r.response } else { "ERR $($r.error)" } }

if ($Part -eq 'dtc') {
    $x.state = 'reading DTC reports'; Save
    # 19 0A = every supported DTC with its status (the BCM times out on 19 02 FF, but 0A returns the same list).
    # 19 02 BF = DTCs with any status bit except "not tested this cycle" (the active / stored ones).
    foreach ($q in '19 01 FF','19 0A','19 02 BF','19 02 08','19 03') { $x.dtc_reports[$q] = Resp (Invoke-Uds $Tx $q -retries 1 -p2star 10000); Save }
    # Per-DTC snapshot (freeze frame) and extended data, for every active / stored DTC
    $list = $x.dtc_reports['19 02 BF']
    if ($list -and $list.StartsWith('59')) {
        $b = $list -split ' '
        for ($i = 3; $i + 3 -lt $b.Length; $i += 4) {
            $dtc3 = ($b[$i..($i+2)] -join ' ')
            $x.dtc_detail[$dtc3] = [ordered]@{
                status = $b[$i+3]
                snapshot = Resp (Invoke-Uds $Tx "19 04 $dtc3 FF" -retries 1 -p2star 10000)
                extended = Resp (Invoke-Uds $Tx "19 06 $dtc3 FF" -retries 1 -p2star 10000)
            }
            Save
        }
    }
    $x.state = 'DTC reports done'; Save
}

if ($Part -eq 'dids') {
    $found = @()
    foreach ($s in 'default','extended') {
        $f = Join-Path $dataDir "mod_$($Tx)_$s.json"
        if (Test-Path $f) { $m = Get-Content -Raw $f | ConvertFrom-Json; $found += @($m.dids.PSObject.Properties | Where-Object { $_.Value.status -eq 'ok' } | ForEach-Object { $_.Name }) }
    }
    $found = @($found | Sort-Object -Unique)
    $x.state = "scaling info for $($found.Count) DIDs"; Save
    foreach ($d in $found) {
        if ($x.scaling.Contains($d)) { continue }
        $r = Invoke-Uds $Tx ('24 ' + $d.Substring(0,2) + ' ' + $d.Substring(2,2)) -retries 1
        $x.scaling[$d] = Resp $r
    }
    Save
    # Static DIDs (identification, as-built) never change; skip sampling them.
    $toSample = @($found | Where-Object { $_ -notmatch '^(F1|DE)' })
    for ($n = 1; $n -le $Samples; $n++) {
        $x.state = "sampling $($toSample.Count) DIDs, pass $n of $Samples"; Save
        foreach ($d in $toSample) {
            $r = Invoke-Uds $Tx ('22 ' + $d.Substring(0,2) + ' ' + $d.Substring(2,2)) -retries 1
            if (-not $x.samples.Contains($d)) { $x.samples[$d] = @() }
            $x.samples[$d] = @($x.samples[$d]) + $(if ($r.ok -and $r.positive) { ($r.response -split ' ' | Select-Object -Skip 3) -join ' ' } else { $null })
        }
        # Mark which bytes changed between samples
        foreach ($d in $toSample) {
            $vals = @($x.samples[$d] | Where-Object { $_ }); if ($vals.Count -lt 2) { continue }
            $len = ($vals[0] -split ' ').Count; $mask = @()
            for ($i = 0; $i -lt $len; $i++) { $set = @($vals | ForEach-Object { ($_ -split ' ')[$i] } | Sort-Object -Unique); if ($set.Count -gt 1) { $mask += $i } }
            $x.dynamic[$d] = $mask
        }
        Save
        try { $v = (Invoke-RestMethod -TimeoutSec 5 "$script:WiCAN/api/battery").voltage; if ($v -lt $MinVolts) { $x.state = "stopped: battery $v V"; Save; return } } catch {}
        if ($n -lt $Samples) { Start-Sleep $SpacingSec }
    }
    $x.state = 'DID extras done'; Save
}
