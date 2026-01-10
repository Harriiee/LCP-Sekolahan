# Build and Flash script untuk WifiPhisher project
# Usage: .\build_and_flash.ps1

param(
    [string]$Action = "build",  # build, upload, or both
    [string]$Port = $null        # COM port (auto-detect jika tidak specified)
)

# Colors untuk output
function Write-Success { Write-Host -ForegroundColor Green $args }
function Write-Error { Write-Host -ForegroundColor Red $args }
function Write-Info { Write-Host -ForegroundColor Cyan $args }

Write-Info "=========================================="
Write-Info "WifiPhisher Build & Flash Tool"
Write-Info "=========================================="

# Detect PlatformIO Python path
$PIO_PYTHON = ".\.venv\Scripts\python.exe"

if (!(Test-Path $PIO_PYTHON)) {
    Write-Error "ERROR: PlatformIO not found at $PIO_PYTHON"
    Write-Info "Please run 'configure_python_environment' first"
    exit 1
}

Write-Success "✓ PlatformIO found"

# Determine action
if ($Action -eq "build" -or $Action -eq "both") {
    Write-Info "`n[1/2] Building firmware..."
    & $PIO_PYTHON -m platformio run -e esp32
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "✗ Build failed!"
        exit 1
    }
    Write-Success "✓ Build successful"
}

if ($Action -eq "upload" -or $Action -eq "both") {
    Write-Info "`n[2/2] Uploading to ESP32..."
    
    # Auto-detect port jika tidak specified
    if ($Port) {
        Write-Info "Using port: $Port"
        & $PIO_PYTHON -m platformio run -e esp32 --target upload --upload-port $Port
    } else {
        Write-Info "Auto-detecting COM port..."
        & $PIO_PYTHON -m platformio run -e esp32 --target upload
    }
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "✗ Upload failed!"
        Write-Info "Try specifying port manually:"
        Write-Info "  .\build_and_flash.ps1 -Action upload -Port COM3"
        exit 1
    }
    Write-Success "✓ Upload successful"
}

Write-Info "`n=========================================="
Write-Success "✓ Done! Connect to WiFi hotspot 'Esp32AP'"
Write-Info "Password: 12345678"
Write-Info "Access: http://192.168.4.1"
Write-Info "=========================================="
