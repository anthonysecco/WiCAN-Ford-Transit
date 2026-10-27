# Tiny static file server for the live preview (localhost only).
param([int]$Port = 8765)
$root = $PSScriptRoot
$l = New-Object Net.HttpListener; $l.Prefixes.Add("http://localhost:$Port/"); $l.Start()
"Serving $root on http://localhost:$Port/"
$types = @{ '.html'='text/html; charset=utf-8'; '.js'='application/javascript; charset=utf-8'; '.json'='application/json; charset=utf-8'; '.pdf'='application/pdf' }
while ($l.IsListening) {
    $ctx = $l.GetContext(); $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
    if (-not $path) { $path = 'preview.html' }
    $full = [IO.Path]::GetFullPath((Join-Path $root $path))
    if ($full.StartsWith($root) -and (Test-Path -PathType Leaf $full)) {
        $ext = [IO.Path]::GetExtension($full); $ct = $types[$ext]; if (-not $ct) { $ct = 'application/octet-stream' }
        try { $bytes = [IO.File]::ReadAllBytes($full) } catch { $bytes = [byte[]]@() }
        $ctx.Response.ContentType = $ct; $ctx.Response.Headers.Add('Cache-Control','no-store')
        $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else { $ctx.Response.StatusCode = 404 }
    $ctx.Response.Close()
}
