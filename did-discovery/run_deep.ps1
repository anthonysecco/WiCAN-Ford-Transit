# Deep read-only sweep of one module, step by step. Each step saves as it goes and can be resumed.
#   1. All DTC reports   2. Full DID space, default session (resumes earlier progress)
#   3. Full DID space, extended session   4. Scaling + live/fixed sampling of every DID found
param([string]$Tx = '726', [int]$Batch = 3, [string]$Ignition = 'off', [double]$MinVolts = 12.0)
. (Join-Path $PSScriptRoot 'wican.ps1')
$dataDir = Join-Path $PSScriptRoot 'data'; New-Item -ItemType Directory -Force $dataDir | Out-Null
$indexPath = Join-Path $dataDir 'index.js'

$keys = @(); if (Test-Path $indexPath) { $m = [regex]::Match((Get-Content -Raw $indexPath), '"modules":\[(.*?)\]'); if ($m.Success) { $keys = @([regex]::Matches($m.Groups[1].Value, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }) } }
foreach ($k in "$($Tx)_default","$($Tx)_extended") { if ($keys -notcontains $k) { $keys += $k } }
$info = Invoke-RestMethod "$script:WiCAN/api/info"
$index = [ordered]@{ vin = '1FTBW2CG5M*******'; vehicle = '2021 Ford Transit'; ignition = $Ignition; device = "$($info.model) fw $($info.fw_version)"; started = (Get-Date).ToString('s'); modules = $keys; focus = $Tx }
[IO.File]::WriteAllText($indexPath, 'window.SCAN=' + ($index | ConvertTo-Json -Compress) + ';')

function Volts { try { (Invoke-RestMethod -TimeoutSec 5 "$script:WiCAN/api/battery").voltage } catch { 99 } }
function Step($name, [scriptblock]$b) { $v = Volts; if ($v -lt $MinVolts) { "SKIP $name : battery $v V"; return }; "$(Get-Date -f HH:mm:ss) $name ($v V)"; & $b }

$here = $PSScriptRoot
Step 'DTC reports'        { & "$here\deep_extras.ps1" -Tx $Tx -Part dtc -MinVolts $MinVolts }
$resume = Test-Path (Join-Path $dataDir "mod_$($Tx)_default.json")
Step 'Default session'    { & "$here\scan_module.ps1" -Tx $Tx -Batch $Batch -Session default -SkipDtc -Resume:$resume -MinVolts $MinVolts }
$resumeX = Test-Path (Join-Path $dataDir "mod_$($Tx)_extended.json")
Step 'Extended session'   { & "$here\scan_module.ps1" -Tx $Tx -Batch $Batch -Session extended -SkipDtc -Resume:$resumeX -MinVolts $MinVolts }
Step 'Scaling + sampling' { & "$here\deep_extras.ps1" -Tx $Tx -Part dids -MinVolts $MinVolts }
"$(Get-Date -f HH:mm:ss) deep sweep finished ($(Volts) V)"
