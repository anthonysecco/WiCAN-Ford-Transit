# Cross-match the "answered but not understood" DIDs against every named Ford DID we have locally,
# across ALL modules and models (Ford DID numbering is largely shared). Writes refs\crossmatch.json.
param([string[]]$ExtraDirs = @())
. (Join-Path $PSScriptRoot 'wican.ps1')
$idx = @{}   # DID -> list of @{hdr; name; formula; unit; source}
function Add-Name($did, $hdr, $name, $formula, $unit, $source) {
    $did = "$did".ToUpper() -replace '^0X',''; if ($did.Length -eq 6 -and $did.StartsWith('22')) { $did = $did.Substring(2) }
    if ($did -notmatch '^[0-9A-F]{4}$' -or -not $name) { return }
    if (-not $idx.ContainsKey($did)) { $idx[$did] = [System.Collections.Generic.List[object]]::new() }
    $h = ("$hdr".ToUpper() -replace '^0X','')
    $idx[$did].Add([pscustomobject]@{ hdr = $h; name = "$name"; formula = "$formula"; unit = "$unit"; source = $source })
}

# OBDb signal sets (project refs + the research agent's extra downloads)
$obdbFiles = @(Get-ChildItem (Join-Path $PSScriptRoot 'refs\obdb') -Filter *.json) + @($ExtraDirs | ForEach-Object { Get-ChildItem (Join-Path $_ 'obdb') -Filter *.json -ErrorAction SilentlyContinue })
$seenModel = @{}
foreach ($f in $obdbFiles) {
    if ($seenModel[$f.BaseName]) { continue }; $seenModel[$f.BaseName] = $true
    try { $j = Get-Content -Raw -Encoding UTF8 $f.FullName | ConvertFrom-Json } catch { continue }
    foreach ($c in @($j.commands)) { if (-not $c -or -not $c.cmd.'22') { continue }
        foreach ($s in @($c.signals)) { if ($s) { Add-Name $c.cmd.'22' $c.hdr $s.name '' $s.fmt.unit "OBDb $($f.BaseName)" } } }
}
# Research agents' JSON (all modules, all vehicles)
foreach ($f in @(Get-ChildItem (Join-Path $PSScriptRoot 'refs\research') -Filter *.json) + @($ExtraDirs | ForEach-Object { Get-Item (Join-Path $_ 'manual.json') -ErrorAction SilentlyContinue })) {
    try { $arr = Get-Content -Raw -Encoding UTF8 $f.FullName | ConvertFrom-Json } catch { continue }
    foreach ($c in @($arr)) { if ($c) { Add-Name $c.did $c.tx $c.name $c.formula $c.unit "research: $($c.vehicles)" } }
}
# Community CSVs (Torque-style)
foreach ($f in @($ExtraDirs | ForEach-Object { Get-ChildItem $_ -Recurse -Filter *.csv -ErrorAction SilentlyContinue })) {
    $lines = @(Get-Content -Encoding UTF8 $f.FullName); $hdr = @($lines[0] -split ',' | ForEach-Object -Begin { $seen = @{} } -Process { $n = $(if ($_) { $_ } else { 'col' }); while ($seen[$n]) { $n += '_' }; $seen[$n] = 1; $n }); $rows = $lines | Select-Object -Skip 1 | ConvertFrom-Csv -Header $hdr
    foreach ($r in $rows) {
        $pidv = $(if ($r.ModeAndPID) { $r.ModeAndPID } elseif ($r.mode_and_pid) { $r.mode_and_pid } else { $null })
        if (-not $pidv -or ("$pidv" -replace '^0x','') -notmatch '^22[0-9A-Fa-f]{4}$') { continue }
        $nm = $(if ($r.long_name) { $r.long_name } elseif ($r.Name) { $r.Name } else { $r.ShortName })
        $hd = $(if ($r.header) { $r.header } elseif ($r.Header -and $r.Header -ne '#N/A') { $r.Header } else { '7E0?' })
        $eq = $(if ($r.equation) { $r.equation } else { $r.Equation })
        Add-Name ("$pidv" -replace '^0x','') $hd $nm $eq $(if ($r.units) { $r.units } else { $r.Units }) "csv $($f.Name) $($r.source_model)"
    }
}
"index: $($idx.Count) distinct named DIDs from $($obdbFiles.Count) OBDb files + research + CSVs"

# Unknown pile: answered, not decoded, not identification (F1xx) or as-built (DExx)
$d = Get-Content -Raw -Encoding UTF8 (Join-Path $PSScriptRoot 'output\ford_transit_2021_discovery.json') | ConvertFrom-Json
$out = @()
foreach ($m in $d.modules) {
    $tx = $m.tx.Substring(2)
    foreach ($x in @($m.dids | Where-Object { $_.status -eq 'ok' -and $_.did -notmatch '^(F1|DE)' })) {
        if (@($x.signals | Where-Object { $_ -and $_.native -and $null -ne $_.value }).Count) { continue }
        $hits = $idx[$x.did]; if (-not $hits) { $out += [pscustomobject]@{ tx = $tx; did = $x.did; len = $x.length; hex = $x.raw_hex; match = 'none'; candidates = @() }; continue }
        $same = @($hits | Where-Object { $_.hdr -eq $tx })
        $match = $(if ($same) { 'same module address' } else { 'other module/vehicle' })
        $names = @(($(if ($same) { $same } else { $hits })) | Group-Object name | Sort-Object Count -Descending | Select-Object -First 4 | ForEach-Object { $g = $_.Group[0]; [pscustomobject]@{ name = $_.Name; hdr = $g.hdr; formula = $g.formula; unit = $g.unit; sources = @($_.Group | ForEach-Object { $_.source } | Select-Object -Unique -First 4) } })
        $out += [pscustomobject]@{ tx = $tx; did = $x.did; len = $x.length; hex = $x.raw_hex; match = $match; candidates = $names }
    }
}
$out | ConvertTo-Json -Depth 6 | Set-Content -Encoding utf8 (Join-Path $PSScriptRoot 'refs\crossmatch.json')
"{0,-4} {1,8} {2,10} {3,12} {4,6}" -f 'tx','unknown','same-addr','other-addr','none'
$out | Group-Object tx | ForEach-Object { "{0,-4} {1,8} {2,10} {3,12} {4,6}" -f $_.Name, $_.Count, @($_.Group | ? match -eq 'same module address').Count, @($_.Group | ? match -eq 'other module/vehicle').Count, @($_.Group | ? match -eq 'none').Count }
"total {0} unknown -> {1} with a candidate name" -f $out.Count, @($out | ? match -ne 'none').Count
