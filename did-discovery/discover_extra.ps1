# Extra HS-CAN discovery: 11-bit 0x600-0x6FF and 29-bit physical 18DAxxF1 (xx = 00..FF). Tester present only.
param([string]$Out = (Join-Path $PSScriptRoot 'data\modules_extra.json'), [int]$Threads = 2)
. (Join-Path $PSScriptRoot 'wican.ps1')
$ids = @(0x600..0x6FF | ForEach-Object { '{0:X3}' -f $_ }) + @(0x00..0xFF | ForEach-Object { '18DA{0:X2}F1' -f $_ })
Wake-Bus
$res = Invoke-Parallel $ids {
    $tx = $args[0]
    $n = $(if ($tx.Length -gt 3) { [Convert]::ToInt32($tx.Substring(4,2),16) } else { [Convert]::ToInt32($tx,16) })
    if (($n % 16) -eq 0) { Wake-Bus }
    $r = Invoke-Uds $tx '3E 00' -retries 0 -NoWake
    if (-not $r.ok) { $r = Invoke-Uds $tx '3E 00' -retries 1 }
    if ($r.ok) { [pscustomobject]@{ tx = $tx; response = $r.response; nrc = $r.nrc_name } }
} -threads $Threads -ProgressFile (Join-Path $PSScriptRoot 'data\discovery_progress.json')
$res = @($res | Where-Object { $_ })
$res | ConvertTo-Json -Depth 4 | Set-Content -Encoding utf8 $Out
"Probed $($ids.Count) addresses; $($res.Count) answered"
$res | Format-Table -AutoSize | Out-String
