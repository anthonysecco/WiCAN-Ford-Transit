# Re-sweep windows of the default-session DID order around suspicious points (key cycles, module hiccups)
# and merge the results into data\mod_<TX>_default.json. Read-only. Run after phase2.ps1 has finished.
#   .\recheck.ps1 -Windows '703:32930','7E0:60162','736:63211','726:15732' -Radius 500
param([string[]]$Windows, [int]$Radius = 500, [string]$Session = 'default', [int]$Port = 3333)
. (Join-Path $PSScriptRoot 'wican.ps1')
Add-Type -Path (Join-Path $PSScriptRoot 'SlcanUds.cs') -ErrorAction SilentlyContinue
$dataDir = Join-Path $PSScriptRoot 'data'
$ranges = @(@(0xF100,0xF1FF),@(0xD100,0xD1FF),@(0xDD00,0xDEFF),@(0xF400,0xF4FF),@(0x4000,0x4FFF),
            @(0xD000,0xD0FF),@(0xD200,0xDCFF),@(0xDF00,0xF0FF),@(0xF200,0xF3FF),@(0xF500,0xFFFF),
            @(0x0000,0x3FFF),@(0x5000,0xCFFF))
$order = [System.Collections.Generic.List[int]]::new(); foreach ($r in $ranges) { for ($d = $r[0]; $d -le $r[1]; $d++) { $order.Add($d) } }

# group windows per module (a module may have several)
$plan = @{}
foreach ($w in $Windows) {
    $tx, $pos = $w.Split(':'); $pos = [int]$pos
    $lo = [Math]::Max(0, $pos - $Radius); $hi = [Math]::Min($order.Count - 1, $pos + $Radius)
    if (-not $plan.ContainsKey($tx)) { $plan[$tx] = [System.Collections.Generic.List[int]]::new() }
    for ($i = $lo; $i -le $hi; $i++) { if (-not $plan[$tx].Contains($order[$i])) { $plan[$tx].Add($order[$i]) } }
}

$bus = New-Object SlcanUds; $bus.Connect('10.0.0.124', $Port); $bus.Wake(0, $true); Start-Sleep -Milliseconds 300
$sweeps = @{}
foreach ($tx in $plan.Keys) { $txi = [Convert]::ToUInt32($tx, 16); $s = New-Object DidSweep($bus, $txi, ($txi + 8), $plan[$tx].ToArray(), 1, ($Session -eq 'extended')); $sweeps[$tx] = $s; $s.Start() }
while (@($sweeps.Values | Where-Object { -not $_.Done }).Count) { Start-Sleep 1 }
$bus.Dispose()

foreach ($tx in $sweeps.Keys) {
    $s = $sweeps[$tx]; $f = Join-Path $dataDir "mod_$($tx)_$Session.json"
    $m = Get-Content -Raw -Encoding UTF8 $f | ConvertFrom-Json
    $dids = [ordered]@{}; foreach ($p in $m.dids.PSObject.Properties) { $dids[$p.Name] = $p.Value }
    $added = @(); $cleared = @(); $changed = @()
    foreach ($d in $plan[$tx]) {
        $k = '{0:X4}' -f $d
        if ($s.Found.ContainsKey($d)) {
            $hex = $s.Found[$d]
            if (-not $dids.Contains($k) -or $dids[$k].status -ne 'ok') {
                $added += $k
                $ascii = Hex2Ascii $hex; $len = @($hex -split ' ' | Where-Object { $_ }).Count
                $dids[$k] = [ordered]@{ name = (Get-DidName $k); status = 'ok'; len = $len; hex = $hex; ascii = $(if ($len -gt 2 -and $ascii.Length -ge [Math]::Max(3, $len * 0.5)) { $ascii.Trim() } else { $null }) }
            }
        } elseif ($s.Refused.ContainsKey($d)) {
            $dids[$k] = [ordered]@{ name = (Get-DidName $k); status = (Get-NrcName $s.Refused[$d]); len = 0; hex = $null; ascii = $null }; $changed += $k
        } elseif ($s.NoReply.ContainsKey($d)) {
            $dids[$k] = [ordered]@{ name = (Get-DidName $k); status = 'no reply'; len = 0; hex = $null; ascii = $null }
        } elseif ($dids.Contains($k) -and $dids[$k].status -ne 'ok') {
            $dids.Remove($k); $cleared += $k     # was a hiccup answer; now plainly "not supported"
        } elseif ($dids.Contains($k) -and $dids[$k].status -eq 'ok') {
            $changed += "$k(now not supported?)"   # keep the earlier positive read, but report it
        }
    }
    $m.dids = [pscustomobject]$dids
    $m.notes = @(@($m.notes) + "rechecked $($plan[$tx].Count) DIDs around $(($Windows | Where-Object { $_ -like "$($tx):*" }) -join ', ') on $(Get-Date -f s): added $($added.Count), cleared $($cleared.Count)") | Where-Object { $_ }
    $json = $m | ConvertTo-Json -Depth 8 -Compress
    [IO.File]::WriteAllText($f, $json); [IO.File]::WriteAllText(($f -replace '\.json$', '.js'), "window.MODS=window.MODS||{};window.MODS['$($tx)_$Session']=$json;")
    "{0}: rechecked {1} DIDs ({2}) | newly found: {3} | cleared hiccups: {4} | changed: {5}" -f $tx, $plan[$tx].Count, $s.State, ($added -join ' '), ($cleared -join ' '), ($changed -join ' ')
}
