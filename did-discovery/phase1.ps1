# Phase 1: find awake modules, then read + decode the known Ford DIDs from each (read-only).
param([switch]$SkipDiscovery, [int]$Parallel = 4, [double]$MinVolts = 11.9, [string]$Ignition = 'on', [switch]$NoHold, [int]$DiscoveryThreads = 4)
. (Join-Path $PSScriptRoot 'wican.ps1')
$dataDir = Join-Path $PSScriptRoot 'data'; New-Item -ItemType Directory -Force $dataDir | Out-Null
$found = Join-Path $dataDir 'modules_keyon.json'

# Keep the WiCAN awake while the battery sags with the key on (10 min, renewable).
function Hold { if ($NoHold) { return }; try { $null = Invoke-RestMethod -TimeoutSec 5 -Method Post -ContentType 'application/json' -Body '{"minutes":10}' "$script:WiCAN/api/sleep/hold" } catch {} }
Hold
"$(Get-Date -f HH:mm:ss) start, battery $((Invoke-RestMethod "$script:WiCAN/api/battery").voltage) V"

if (-not $SkipDiscovery -or -not (Test-Path $found)) {
    "$(Get-Date -f HH:mm:ss) discovering modules (about 3 min)"
    & (Join-Path $PSScriptRoot 'discover.ps1') -Out $found -Threads $DiscoveryThreads | Out-Null
}
$mods = @(Get-Content -Raw $found | ConvertFrom-Json | ForEach-Object { $_.tx })
"$(Get-Date -f HH:mm:ss) $($mods.Count) modules awake: $($mods -join ' ')"

$info = Invoke-RestMethod "$script:WiCAN/api/info"
$index = [ordered]@{ vin = '1FTBW2CG5M*******'; vehicle = '2021 Ford Transit'; ignition = $Ignition; phase = 'Phase 1: known Ford DIDs'
    device = "$($info.model) fw $($info.fw_version)"; started = (Get-Date).ToString('s'); modules = @($mods | ForEach-Object { "$($_)_phase1" }); focus = '' }
[IO.File]::WriteAllText((Join-Path $dataDir 'index.js'), 'window.SCAN=' + ($index | ConvertTo-Json -Compress) + ';')

$queue = [Collections.Queue]::new(); $mods | ForEach-Object { $queue.Enqueue($_) }
$running = @(); $lastHold = Get-Date
while ($queue.Count -or $running.Count) {
    $running = @($running | Where-Object { -not $_.HasExited })
    while ($running.Count -lt $Parallel -and $queue.Count) {
        $tx = $queue.Dequeue()
        $running += Start-Process powershell -PassThru -WindowStyle Hidden -ArgumentList @('-NoProfile','-File',(Join-Path $PSScriptRoot 'phase1_module.ps1'),'-Tx',$tx,'-MinVolts',$MinVolts)
    }
    if (((Get-Date) - $lastHold).TotalMinutes -gt 8) { Hold; $lastHold = Get-Date }
    Start-Sleep 2
}
"$(Get-Date -f HH:mm:ss) Phase 1 finished, battery $((Invoke-RestMethod "$script:WiCAN/api/battery").voltage) V"
