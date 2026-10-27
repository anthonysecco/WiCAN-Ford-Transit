# Phase 2: full read-only DID sweep (0x0000-0xFFFF) of every module, in parallel, over raw CAN (SLCAN socket).
# Resumable and self-recovering: progress lives in data\mod_<TX>_<session>.json; if the WiCAN drops the
# connection (or reboots), the runner waits, reconnects and resumes each module a little before where it stopped.
param(
    [string[]]$Modules = @('7E0','726','7D0','703','736'),
    [ValidateSet('default','extended')][string]$Session = 'default',
    [int]$Port = 3333, [double]$MinVolts = 11.9, [int]$MaxRounds = 6, [int]$ResumeMargin = 300, [int]$FrameGapMs = 4
)
. (Join-Path $PSScriptRoot 'wican.ps1')
Add-Type -Path (Join-Path $PSScriptRoot 'SlcanUds.cs') -ErrorAction SilentlyContinue
$dataDir = Join-Path $PSScriptRoot 'data'
$L = (Get-Content -Raw -Encoding UTF8 (Join-Path $PSScriptRoot 'refs\ford_did_library.json') | ConvertFrom-Json).entries

$ranges = @(@(0xF100,0xF1FF),@(0xD100,0xD1FF),@(0xDD00,0xDEFF),@(0xF400,0xF4FF),@(0x4000,0x4FFF),
            @(0xD000,0xD0FF),@(0xD200,0xDCFF),@(0xDF00,0xF0FF),@(0xF200,0xF3FF),@(0xF500,0xFFFF),
            @(0x0000,0x3FFF),@(0x5000,0xCFFF))
$order = [System.Collections.Generic.List[int]]::new(); foreach ($r in $ranges) { for ($d = $r[0]; $d -le $r[1]; $d++) { $order.Add($d) } }

$keys = @($Modules | ForEach-Object { "$($_)_$Session" })
$info = Invoke-RestMethod "$script:WiCAN/api/info"
[IO.File]::WriteAllText((Join-Path $dataDir 'index.js'), 'window.SCAN=' + ([ordered]@{ vin = '1FTBW2CG5M*******'; vehicle = '2021 Ford Transit'; ignition = 'on'
    phase = "Phase 2: full DID sweep ($Session session, raw CAN)"; device = "$($info.model) fw $($info.fw_version)"; started = (Get-Date).ToString('s'); modules = $keys; focus = '' } | ConvertTo-Json -Compress) + ';')

function Load-Module($tx) {
    $f = Join-Path $dataDir "mod_$($tx)_$Session.json"
    if (Test-Path $f) { $m = Get-Content -Raw -Encoding UTF8 $f | ConvertFrom-Json; if ($m.engine -eq 'raw-can') { return $m } }
    $null
}

function Save-Module($tx, $e) {
    $s = $e.sweep
    $dids = [ordered]@{}
    if ($e.prior) { foreach ($p in $e.prior.dids.PSObject.Properties) { $dids[$p.Name] = $p.Value } }
    foreach ($k in ($s.Found.Keys | Sort-Object)) {
        $did = '{0:X4}' -f $k; $hex = $s.Found[$k]; $ascii = Hex2Ascii $hex; $len = @($hex -split ' ' | Where-Object { $_ }).Count
        $ent = $L."$($tx):$did"
        $name = $(if ($ent) { (@($ent.signals) + @($ent.repo_signals) | Where-Object { $_ } | ForEach-Object { $_.name }) -join '; ' } else { Get-DidName $did })
        $dids[$did] = [ordered]@{ name = $name; status = 'ok'; len = $len; hex = $hex; ascii = $(if ($len -gt 2 -and $ascii.Length -ge [Math]::Max(3, $len * 0.5)) { $ascii.Trim() } else { $null }) }
    }
    foreach ($k in $s.Refused.Keys) { $did = '{0:X4}' -f $k; if (-not $dids.Contains($did)) { $dids[$did] = [ordered]@{ name = (Get-DidName $did); status = (Get-NrcName $s.Refused[$k]); len = 0; hex = $null; ascii = $null } } }
    foreach ($k in $s.NoReply.Keys) { $did = '{0:X4}' -f $k; if (-not $dids.Contains($did)) { $dids[$did] = [ordered]@{ name = (Get-DidName $did); status = 'no reply'; len = 0; hex = $null; ascii = $null } } }
    foreach ($did in @($script:hazards[$tx])) { if ($did) { $dids[$did] = [ordered]@{ name = (Get-DidName $did); status = 'module stops responding when read'; len = 0; hex = $null; ascii = $null } } }
    $checked = $e.skip + $s.Checked
    $state = $(if ($s.State -eq 'done') { 'done' } elseif ($s.Done) { "paused ($($s.State))" } else { $s.State })
    $mod = [ordered]@{
        tx = $tx; rx = (RxFor $tx); name = $script:ModuleNames[$tx]; session = $Session; engine = 'raw-can'; state = $state
        started = $e.firstStart; updated = (Get-Date).ToString('s'); rounds = $e.round
        progress = [ordered]@{ checked = $checked; total = $order.Count; requests = $s.Requests; current = $(if ($checked -lt $order.Count) { '{0:X4}' -f $order[$checked] } else { '' }) }
        rate_per_s = [Math]::Round($s.Checked / [Math]::Max(1, ((Get-Date) - $e.roundStart).TotalSeconds), 1)
        timeouts = $s.Timeouts; batch = $s.Batch; volts = $script:volts; dtcs = @(); dtc_raw = [ordered]@{}; dids = $dids; notes = @()
    }
    $json = $mod | ConvertTo-Json -Depth 8 -Compress
    $jp = Join-Path $dataDir "mod_$($tx)_$Session.json"; $jsp = Join-Path $dataDir "mod_$($tx)_$Session.js"
    [IO.File]::WriteAllText("$jp.tmp", $json); Move-Item -Force "$jp.tmp" $jp
    [IO.File]::WriteAllText("$jsp.tmp", "window.MODS=window.MODS||{};window.MODS['$($tx)_$Session']=$json;"); Move-Item -Force "$jsp.tmp" $jsp
}

function Wait-WiCAN { for ($i = 0; $i -lt 60; $i++) { try { $null = Invoke-RestMethod -TimeoutSec 3 "$script:WiCAN/api/info"; Start-Sleep 5; return $true } catch { Start-Sleep 3 } }; $false }

$script:volts = $null
$script:hazards = @{}   # tx -> DIDs whose read makes the module stop answering
for ($round = 1; $round -le $MaxRounds; $round++) {
    $todo = @($Modules | Where-Object { $m = Load-Module $_; -not $m -or $m.state -ne 'done' })
    if (-not $todo) { break }
    if (-not (Wait-WiCAN)) { "$(Get-Date -f HH:mm:ss) WiCAN unreachable; giving up"; break }
    $bus = New-Object SlcanUds; $bus.MinFrameGapMs = $FrameGapMs
    try { $bus.Connect('10.0.0.124', $Port) } catch { "$(Get-Date -f HH:mm:ss) connect failed: $($_.Exception.Message)"; Start-Sleep 10; continue }
    $bus.Wake(0, $true); Start-Sleep -Milliseconds 300
    "$(Get-Date -f HH:mm:ss) round ${round}: $($todo -join ' ')"
    $sweeps = @{}
    foreach ($tx in $todo) {
        $prior = Load-Module $tx
        $skip = 0; if ($prior) { $skip = [Math]::Max(0, [int]$prior.progress.checked - $(if ($round -gt 1 -or $prior.state -ne 'done') { $ResumeMargin } else { 0 })) }
        if ($prior -and [int]$prior.progress.checked -eq 0) { $skip = 0 }
        $txi = [Convert]::ToUInt32($tx, 16)
        $list = [int[]]($order.GetRange($skip, $order.Count - $skip))
        $s = New-Object DidSweep($bus, $txi, ($txi + 8), $list, 1, ($Session -eq 'extended'))
        $sweeps[$tx] = @{ sweep = $s; skip = $skip; prior = $prior; round = $round; roundStart = (Get-Date); firstStart = $(if ($prior) { $prior.started } else { (Get-Date).ToString('s') }) }
        $s.Start()
    }
    $low = 0
    while ($true) {
        Start-Sleep 3
        try { $script:volts = (Invoke-RestMethod -TimeoutSec 5 "$script:WiCAN/api/battery").voltage } catch {}
        foreach ($tx in $sweeps.Keys) { Save-Module $tx $sweeps[$tx] }
        if ($script:volts -and $script:volts -lt $MinVolts) { $low++ } else { $low = 0 }
        if ($low -ge 2) { "$(Get-Date -f HH:mm:ss) battery $($script:volts) V: stopping"; foreach ($e in $sweeps.Values) { $e.sweep.Stop = $true }; $round = $MaxRounds }
        $line = ($sweeps.Keys | Sort-Object | ForEach-Object { $e = $sweeps[$_]; "{0} {1,5}/{2} {3}" -f $_, ($e.skip + $e.sweep.Checked), $order.Count, $e.sweep.State }) -join ' | '
        "$(Get-Date -f HH:mm:ss) $($script:volts) V  $line"
        # a stalled module (asleep, rebooting after a key cycle, SYNC still booting) is retried on its own after 30 s
        foreach ($tx in @($sweeps.Keys)) {
            $e = $sweeps[$tx]
            if (-not ($e.sweep.Done -and $e.sweep.State -eq 'stalled') -or $low -ge 2 -or $e.retries -ge 20) { continue }
            if (-not $e.retryAt) { $e.retryAt = (Get-Date).AddSeconds(45); continue }
            if ((Get-Date) -lt $e.retryAt) { continue }
            Save-Module $tx $e
            $stallPos = $e.skip + $e.sweep.Checked
            $p = Load-Module $tx; $skip = [Math]::Max(0, [int]$p.progress.checked - $ResumeMargin)
            if ($e.lastStallPos -eq $stallPos) {
                # second stall on the same DID: reading it knocks the module over. Record it and step past it.
                $bad = '{0:X4}' -f $order[$stallPos]
                if (-not $script:hazards.ContainsKey($tx)) { $script:hazards[$tx] = @() }
                $script:hazards[$tx] += $bad
                "$(Get-Date -f HH:mm:ss) $tx stops responding when DID $bad is read: skipping it"
                $skip = $stallPos + 1
            }
            $e.lastStallPos = $stallPos
            $txi = [Convert]::ToUInt32($tx, 16)
            $s = New-Object DidSweep($bus, $txi, ($txi + 8), [int[]]($order.GetRange($skip, $order.Count - $skip)), 1, ($Session -eq 'extended'))
            $e.sweep = $s; $e.skip = $skip; $e.prior = $p; $e.retryAt = $null; $e.retries = 1 + [int]$e.retries; $e.roundStart = (Get-Date)
            "$(Get-Date -f HH:mm:ss) retrying $tx from $skip (attempt $($e.retries))"
            $s.Start()
        }
        if (@($sweeps.Values | Where-Object { -not $_.sweep.Done -or ($_.sweep.State -eq 'stalled' -and $low -lt 2 -and [int]$_.retries -lt 20) }).Count -eq 0) { break }
    }
    foreach ($tx in $sweeps.Keys) { Save-Module $tx $sweeps[$tx] }
    $bus.Dispose()
}
"$(Get-Date -f HH:mm:ss) Phase 2 ($Session) finished: " + (($Modules | ForEach-Object { $m = Load-Module $_; "$_=$($m.state)" }) -join ' ')
