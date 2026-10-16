<#
.SYNOPSIS
    Script tự động render toàn bộ mã PlantUML (*.puml) trong thư mục diagrams/ thành ảnh PNG trong thư mục renders/.
.DESCRIPTION
    Hỗ trợ 2 phương thức:
    1. Sử dụng plantuml.jar cục bộ (nếu có Java và plantuml.jar).
    2. Sử dụng PlantUML Web Service hoặc Docker container nếu chạy online.
#>

param(
    [string]$DiagramsDir = "$PSScriptRoot\..\diagrams",
    [string]$RendersDir = "$PSScriptRoot\..\renders",
    [string]$PlantUmlJar = "$PSScriptRoot\plantuml.jar"
)

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   BẮT ĐẦU RENDER BIỂU ĐỒ PLANTUML CHO ĐỒ ÁN IT3120   " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

if (Test-Path $PlantUmlJar) {
    Write-Host "[INFO] Tìm thấy file plantuml.jar tại: $PlantUmlJar" -ForegroundColor Green
    Write-Host "[INFO] Tiến hành render toàn bộ diagrams..." -ForegroundColor Yellow
    $resolvedDiagrams = (Resolve-Path $DiagramsDir).Path
    $resolvedRenders = (Resolve-Path $RendersDir).Path
    Get-ChildItem -Path $DiagramsDir -Recurse -Filter *.puml | ForEach-Object {
        $relDir = $_.DirectoryName.Substring($resolvedDiagrams.Length).TrimStart('\', '/')
        $targetDir = if ($relDir) { Join-Path $resolvedRenders $relDir } else { $resolvedRenders }
        if (!(Test-Path $targetDir)) { New-Item -ItemType Directory -Force -Path $targetDir | Out-Null }
        java -jar $PlantUmlJar -tpng -o $targetDir $_.FullName
    }
    Write-Host "[SUCCESS] Hoàn thành xuất ảnh biểu đồ vào $RendersDir" -ForegroundColor Green
} else {
    Write-Host "[NOTE] Chưa tìm thấy $PlantUmlJar cục bộ." -ForegroundColor Yellow
    Write-Host "[TIP] Bạn có thể:" -ForegroundColor Cyan
    Write-Host "  1. Tải plantuml.jar từ https://plantuml.com/download và đặt vào thư mục scripts/"
    Write-Host "  2. Cài đặt tiện ích mở rộng 'PlantUML' trong VS Code / IntelliJ để bấm Alt+D xem trực tiếp."
    Write-Host "  3. Push lên GitHub để GitHub Actions tự động render vào thư mục renders/."
}

