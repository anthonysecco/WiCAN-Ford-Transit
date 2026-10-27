# Merge OBDb Ford signal sets (refs\obdb\*.json) into one known-DID library: refs\ford_did_library.json
# Source data: OBDb (https://github.com/OBDb), CC BY-SA 4.0.
. (Join-Path $PSScriptRoot 'wican.ps1')
$dir = Join-Path $PSScriptRoot 'refs\obdb'
# Earlier entries win when two models define the same module+DID differently (closest platform first).
$pref = 'Ford-Transit','Ford-Transit-Connect','Ford-E-Series','Ford-F-250','Ford-F-350','Ford-F-150','Ford-Expedition',
        'Ford-Explorer','Ford-Ranger','Ford-Bronco','Ford-Maverick','Ford-Bronco-Sport','Ford-Escape','Ford-Edge','Ford-Mustang','Ford'

$lib = [ordered]@{}
foreach ($src in $pref) {
    $f = Join-Path $dir "$src.json"; if (-not (Test-Path $f)) { continue }
    $j = Get-Content -Raw -Encoding UTF8 $f | ConvertFrom-Json
    foreach ($c in @($j.commands)) {
        if (-not $c) { continue }
        $did = $c.cmd.'22'; if (-not $did) { continue }
        $key = "$($c.hdr):$did"
        if (-not $lib.Contains($key)) {
            $lib[$key] = [ordered]@{
                hdr = $c.hdr; rax = $(if ($c.rax) { $c.rax } else { $null }); did = $did; service = '22'
                defined_by = $src; also_in = @(); freq = $c.freq
                signals = @($c.signals | ForEach-Object { [ordered]@{ id = $_.id; name = $_.name; path = $_.path; fmt = $_.fmt } })
            }
        } elseif ($lib[$key].defined_by -ne $src -and $lib[$key].also_in -notcontains $src) {
            $lib[$key].also_in += $src
        }
    }
}
# Supplement: verified Transit DIDs from the WiCAN-Ford-Transit project (refs\transit_repo\PIDs.md).
$repoMd = Join-Path $PSScriptRoot 'refs\transit_repo\PIDs.md'
$abbrToTx = @{ PCM = '7E0'; BCM = '726'; AWDM = '703'; ABS = '760'; IPC = '720'; TCM = '7E1'; APIM = '7D0'; PSCM = '730'; RCM = '737'; GWM = '716' }
$repoAdded = 0
if (Test-Path $repoMd) {
    $tx = $null
    foreach ($line in Get-Content -Encoding UTF8 $repoMd) {
        if ($line -match '^#{2,3} .*\(([A-Z]+)\)') { $tx = $abbrToTx[$Matches[1]]; continue }
        if (-not $tx -or $line -notmatch '^\|\s*0x22([0-9A-Fa-f]{4})\s*\|') { continue }
        $did = $Matches[1].ToUpper()
        $c = @($line.Trim('|').Split('|') | ForEach-Object { $_.Trim() })
        if ($c.Count -lt 6) { continue }
        $status = $(if ($c[5] -match [char]0x2705 -or $c[5] -match 'âœ…') { 'verified' } else { 'in progress' })
        $sig = [ordered]@{ id = ($c[1] -replace '\\', ''); name = $c[2]; path = 'WiCAN-Ford-Transit'; expr = ($c[4] -replace '\\', ''); unit = $c[3]; repo_status = $status }
        $key = "$($tx):$did"
        if (-not $lib.Contains($key)) {
            $lib[$key] = [ordered]@{ hdr = $tx; rax = (RxFor $tx); did = $did; service = '22'; defined_by = 'WiCAN-Ford-Transit'; also_in = @(); freq = $null; signals = @() }
        }
        $lib[$key].repo_signals = @($lib[$key].repo_signals | Where-Object { $_ }) + $sig
        $repoAdded++
    }
}
"Added $repoAdded signal(s) from WiCAN-Ford-Transit PIDs.md"

$out = [ordered]@{
    source = 'OBDb Ford signal sets (https://github.com/OBDb), CC BY-SA 4.0; plus WiCAN-Ford-Transit PIDs.md (github.com/anthonysecco/WiCAN-Ford-Transit)'
    built = (Get-Date).ToString('s'); models = $pref; count = $lib.Count; entries = $lib
}
$libPath = Join-Path $PSScriptRoot 'refs\ford_did_library.json'
[IO.File]::WriteAllText("$libPath.tmp", ($out | ConvertTo-Json -Depth 10)); Move-Item -Force "$libPath.tmp" $libPath   # atomic swap: scanners may be reading it
"Library: $($lib.Count) module+DID entries"
$lib.Values | ForEach-Object { [pscustomobject]$_ } | Group-Object hdr | Sort-Object Count -Descending | ForEach-Object { "  $($_.Name): $($_.Count)" }
