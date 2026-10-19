# IT3120 - Script render PlantUML sang PNG
param(
    [string]$DiagramsDir = "$PSScriptRoot\..\diagrams",
    [string]$RendersDir = "$PSScriptRoot\..\renders",
    [string]$PlantUmlJar = "$PSScriptRoot\plantuml.jar"
)

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   BAT DAU RENDER BIEU DO PLANTUML CHO DO AN IT3120   " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

if (Test-Path $PlantUmlJar) {
    Write-Host "[INFO] Tim thay file plantuml.jar tai: $PlantUmlJar" -ForegroundColor Green
    Write-Host "[INFO] Tien hanh render toan bo diagrams..." -ForegroundColor Yellow
    $resolvedDiagrams = (Resolve-Path $DiagramsDir).Path
    $resolvedRenders = (Resolve-Path $RendersDir).Path
    Get-ChildItem -Path $DiagramsDir -Recurse -Filter *.puml | ForEach-Object {
        $relDir = $_.DirectoryName.Substring($resolvedDiagrams.Length).TrimStart('\', '/')
        $targetDir = if ($relDir) { Join-Path $resolvedRenders $relDir } else { $resolvedRenders }
        if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Force -Path $targetDir | Out-Null }
        Write-Host "Rendering: $($_.Name) -> $targetDir"
        java -jar $PlantUmlJar -tpng -o $targetDir $_.FullName
    }
    Write-Host "[SUCCESS] Hoan thanh xuat anh bieu do vao $RendersDir" -ForegroundColor Green
} else {
    Write-Host "[NOTE] Chua tim thay $PlantUmlJar cuc bo." -ForegroundColor Yellow
    Write-Host "[TIP] Ban co the:" -ForegroundColor Cyan
    Write-Host "  1. Tai plantuml.jar tu https://plantuml.com/download va dat vao thu muc scripts/"
    Write-Host "  2. Cai dat extension PlantUML tren VS Code de xem truc tiep (Alt+D)"
    Write-Host "  3. Push len GitHub de GitHub Actions tu dong render vao thu muc renders/"
}
