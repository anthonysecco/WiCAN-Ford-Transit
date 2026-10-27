# Live monitor for the preview: polls the WiCAN once a second (status only, no bus traffic)
# and writes data\live.js with what the scanner is doing right now.
param([int]$IntervalMs = 1000)
. (Join-Path $PSScriptRoot 'wican.ps1')
$out = Join-Path $PSScriptRoot 'data\live.js'
$recent = New-Object System.Collections.Generic.List[object]
$seen = @{}; $lastKey = ''
while ($true) {
    $now = Get-Date
    try { $u = Invoke-RestMethod -TimeoutSec 3 "$script:WiCAN/api/uds" } catch { $u = $null }
    try { $s = Invoke-RestMethod -TimeoutSec 3 "$script:WiCAN/api/sleep" } catch { $s = $null }
    $last = $null
    if ($u -and $u.last) {
        $l = $u.last
        $key = "$($l.tx_id)|$($u.provider_stats.pdus_tx)"
        if ($key -ne $lastKey) {
            $lastKey = $key
            $result = $(if (-not $l.ok) { 'no answer' } elseif ($l.positive) { 'answered' } else { "refused ($($l.nrc_name))" })
            $recent.Insert(0, [pscustomobject]@{ t = $now.ToString('HH:mm:ss'); tx = $l.tx_id; result = $result })
            while ($recent.Count -gt 12) { $recent.RemoveAt($recent.Count - 1) }
            if ($l.ok -and $l.tx_id -ne '7DF') { $seen[$l.tx_id] = $true }
        }
        $last = [ordered]@{ tx = $l.tx_id; name = $script:ModuleNames[$l.tx_id]; age_ms = $l.age_ms; ok = $l.ok; positive = $l.positive; nrc = $l.nrc_name; elapsed_ms = $l.elapsed_ms }
    }
    $disc = $null; $dp = Join-Path $PSScriptRoot 'data\discovery_progress.json'
    if (Test-Path $dp) { try { $disc = Get-Content -Raw $dp | ConvertFrom-Json } catch {} }
    $live = [ordered]@{
        updated = $now.ToString('HH:mm:ss'); wican_online = [bool]$u
        last = $last; recent = $recent.ToArray(); answered_this_session = @($seen.Keys | Sort-Object)
        requests_sent = $(if ($u) { $u.provider_stats.pdus_tx } else { $null })
        battery = $(if ($s) { $s.voltage } else { $null }); sleep_state = $(if ($s) { $s.state } else { $null })
        sleep_pending = $(if ($s) { $s.pending } else { $null }); sleep_in_s = $(if ($s) { $s.sleep_in_s } else { $null }); holds_left = $(if ($s) { $s.holds_left } else { $null })
        discovery = $disc
    }
    try { [IO.File]::WriteAllText("$out.tmp", 'window.LIVE=' + ($live | ConvertTo-Json -Depth 6 -Compress) + ';'); Move-Item -Force "$out.tmp" $out } catch {}
    $wait = $IntervalMs - [int]((Get-Date) - $now).TotalMilliseconds; if ($wait -gt 0) { Start-Sleep -Milliseconds $wait }
}
