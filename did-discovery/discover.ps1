# Find every module answering on 11-bit diagnostic IDs 0x700-0x7F7 (tester present, read-only).
param([string]$Out = (Join-Path $PSScriptRoot 'data\modules_found.json'), [int]$Threads = 2)
. (Join-Path $PSScriptRoot 'wican.ps1')
New-Item -ItemType Directory -Force (Split-Path $Out) | Out-Null

$ids = 0x700..0x7F7 | ForEach-Object { '{0:X3}' -f $_ }
Wake-Bus
# Note: more than ~2 threads makes the WiCAN drop replies (it handles one request at a time).
$res = Invoke-Parallel $ids {
    $tx = $args[0]
    if (([Convert]::ToInt32($tx,16) % 16) -eq 0) { Wake-Bus }   # re-wake every 16 addresses
    $r = Invoke-Uds $tx '3E 00' -retries 0 -NoWake
    if (-not $r.ok) { $r = Invoke-Uds $tx '3E 00' -retries 1 }   # second try with wake
    if ($r.ok) { [pscustomobject]@{ tx = $tx; rx = (RxFor $tx); response = $r.response } }
} -threads $Threads -ProgressFile (Join-Path $PSScriptRoot 'data\discovery_progress.json')

$res = @($res | Where-Object { $_ } | Sort-Object tx)
$res | ConvertTo-Json -Depth 4 | Set-Content -Encoding utf8 $Out
"Found $($res.Count) module(s):"; $res | Format-Table -AutoSize | Out-String
