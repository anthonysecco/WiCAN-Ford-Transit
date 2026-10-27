# Launch read-only sweeps of several modules in parallel (one process per module) and keep the preview index current.
param(
    [string[]]$Modules = @('726:3','7D0:5'),   # tx:batch
    [ValidateSet('default','extended')][string]$Session = 'default',
    [string]$Ignition = 'off'
)
. (Join-Path $PSScriptRoot 'wican.ps1')
$dataDir = Join-Path $PSScriptRoot 'data'; New-Item -ItemType Directory -Force $dataDir | Out-Null
$indexPath = Join-Path $dataDir 'index.js'

# Keep every module key ever scanned in the index so the preview shows all passes.
$keys = @(); if (Test-Path $indexPath) { $m = [regex]::Match((Get-Content -Raw $indexPath), '"modules":\[(.*?)\]'); if ($m.Success) { $keys = @([regex]::Matches($m.Groups[1].Value, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }) } }
foreach ($m in $Modules) { $k = "$($m.Split(':')[0])_$Session"; if ($keys -notcontains $k) { $keys += $k } }

$info = Invoke-RestMethod "$script:WiCAN/api/info"
$index = [ordered]@{
    vin = '1FTBW2CG5M*******'; vehicle = '2021 Ford Transit'; ignition = $Ignition
    device = "$($info.model) fw $($info.fw_version)"; started = (Get-Date).ToString('s'); modules = $keys
}
[IO.File]::WriteAllText($indexPath, 'window.SCAN=' + ($index | ConvertTo-Json -Compress) + ';')

$procs = foreach ($m in $Modules) {
    $tx, $batch = $m.Split(':')
    Start-Process powershell -PassThru -WindowStyle Hidden -ArgumentList @('-NoProfile','-File',(Join-Path $PSScriptRoot 'scan_module.ps1'),'-Tx',$tx,'-Batch',$batch,'-Session',$Session)
}
"Started $($procs.Count) scan(s): $($Modules -join ', ') [$Session]"
$procs | Wait-Process
"All scans finished."
