# Simple GitHub Upload Script
# Usage: .\github_upload_simple.ps1

param(
    [string]$GitHubUsername = "Harriiee",
    [string]$RepositoryName = "wificlone"
)

Write-Host "=========================================="
Write-Host "GitHub Upload for WifiClone" -ForegroundColor Cyan
Write-Host "=========================================="

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git not found!" -ForegroundColor Red
    Write-Host "Install from: https://git-scm.com/downloads" -ForegroundColor Yellow
    exit 1
}

$RepoURL = "https://github.com/$GitHubUsername/$RepositoryName.git"

Write-Host "`nRepository URL: $RepoURL" -ForegroundColor Cyan

# Step 1: Init
Write-Host "`n[1/6] Initializing Git repository..." -ForegroundColor Cyan
git init
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to initialize Git" -ForegroundColor Red
    exit 1
}
Write-Host "OK" -ForegroundColor Green

# Step 2: Config user
Write-Host "`n[2/6] Configuring Git user..." -ForegroundColor Cyan
$userName = git config user.name
if ([string]::IsNullOrEmpty($userName)) {
    Write-Host "Setting default user..." -ForegroundColor Yellow
    git config user.name "WifiClone Builder"
    git config user.email "builder@wificlone.local"
}
Write-Host "OK" -ForegroundColor Green

# Step 3: Add files
Write-Host "`n[3/6] Adding files..." -ForegroundColor Cyan
git add .
Write-Host "OK" -ForegroundColor Green

# Step 4: Commit
Write-Host "`n[4/6] Creating commit..." -ForegroundColor Cyan
git commit -m "Initial commit - WifiClone with credentials capture"
if ($LASTEXITCODE -ne 0) {
    Write-Host "WARNING: Commit may have issues, continuing..." -ForegroundColor Yellow
}
Write-Host "OK" -ForegroundColor Green

# Step 5: Add remote
Write-Host "`n[5/6] Adding remote..." -ForegroundColor Cyan
git remote remove origin 2>$null
git remote add origin $RepoURL
Write-Host "OK" -ForegroundColor Green

# Step 6: Push
Write-Host "`n[6/6] Pushing to GitHub..." -ForegroundColor Cyan
Write-Host "You may be prompted for GitHub credentials..." -ForegroundColor Yellow
git branch -M main
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n=========================================="
    Write-Host "SUCCESS!" -ForegroundColor Green
    Write-Host "Repository: https://github.com/$GitHubUsername/$RepositoryName" -ForegroundColor Green
    Write-Host "=========================================="
} else {
    Write-Host "`nERROR: Push failed" -ForegroundColor Red
    Write-Host "Check: git remote -v" -ForegroundColor Yellow
}
