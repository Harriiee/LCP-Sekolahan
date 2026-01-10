# GitHub Upload Script untuk WifiPisseryakntl
# Jalankan script ini setelah membuat repository di GitHub.com
# Usage: .\upload_to_github.ps1

param(
    [string]$GitHubUsername = "",
    [string]$RepositoryName = "WifiPisseryakntl",
    [string]$CommitMessage = "Initial commit - WifiPisseryakntl with cloned login page credentials capture"
)

# Colors untuk output
function Write-Success { Write-Host -ForegroundColor Green $args }
function Write-Error { Write-Host -ForegroundColor Red $args }
function Write-Warning { Write-Host -ForegroundColor Yellow $args }
function Write-Info { Write-Host -ForegroundColor Cyan $args }

Write-Info "=========================================="
Write-Info "GitHub Upload Tool"
Write-Info "=========================================="

# Check if Git is installed
try {
    $gitVersion = git --version 2>$null
    Write-Success "✓ Git found: $gitVersion"
} catch {
    Write-Error "✗ Git not found!"
    Write-Warning "Please install Git from: https://git-scm.com/downloads"
    Write-Info "After installing, run this script again."
    exit 1
}

# Validate inputs
if ([string]::IsNullOrEmpty($GitHubUsername)) {
    Write-Warning "No GitHub username provided."
    $GitHubUsername = Read-Host "Enter your GitHub username"
}

if ([string]::IsNullOrEmpty($RepositoryName)) {
    $RepositoryName = "WifiPisseryakntl"
}

$RepoURL = "https://github.com/$GitHubUsername/$RepositoryName.git"

Write-Info "`nConfiguration:"
Write-Info "  GitHub User: $GitHubUsername"
Write-Info "  Repository: $RepositoryName"
Write-Info "  Repository URL: $RepoURL"

Write-Warning "`nIMPORTANT: Make sure you've created the repository on GitHub first!"
Write-Info "Go to: https://github.com/new"
Write-Info "  1. Create new repository with name: $RepositoryName"
Write-Info "  2. Do NOT initialize with README/gitignore (we have them already)"
Write-Info "  3. Come back and run this script"

$continue = Read-Host "`nRepository created on GitHub? (y/n)"
if ($continue -ne "y") {
    Write-Info "Aborted. Create the repository first then run this script again."
    exit 0
}

# Initialize Git repository
Write-Info "`n[1/4] Initializing local Git repository..."
try {
    git init
    Write-Success "✓ Git repository initialized"
} catch {
    Write-Error "✗ Failed to initialize Git repository"
    exit 1
}

# Configure Git user (optional but recommended)
Write-Info "`n[2/4] Configuring Git user..."
$userName = git config user.name
if ([string]::IsNullOrEmpty($userName)) {
    $name = Read-Host "Enter your name (for Git commits)"
    $email = Read-Host "Enter your email (for Git commits)"
    git config user.name "$name"
    git config user.email "$email"
    Write-Success "✓ Git user configured"
} else {
    Write-Success "✓ Git user already configured: $userName"
}

# Add all files
Write-Info "`n[3/4] Adding files to Git..."
try {
    git add .
    Write-Success "✓ Files added"
} catch {
    Write-Error "✗ Failed to add files"
    exit 1
}

# Create initial commit
Write-Info "`n[4/4] Creating initial commit..."
try {
    git commit -m "$CommitMessage"
    Write-Success "✓ Commit created"
} catch {
    Write-Error "✗ Failed to create commit"
    exit 1
}

# Add remote and push
Write-Info "`nAdding remote repository..."
try {
    git remote add origin $RepoURL
    Write-Success "✓ Remote added"
} catch {
    Write-Error "✗ Failed to add remote (might already exist)"
}

Write-Info "`nPushing to GitHub..."
Write-Warning "Note: You may be prompted to authenticate with GitHub"
try {
    git branch -M main
    git push -u origin main
    Write-Success "✓ Pushed to GitHub successfully!"
} catch {
    Write-Error "✗ Failed to push to GitHub"
    Write-Warning "Possible reasons:"
    Write-Warning "  1. Authentication failed - Check your GitHub credentials"
    Write-Warning "  2. Repository already has commits - Try: git push --force -u origin main"
    Write-Warning "  3. Wrong repository URL - Check: git remote -v"
    exit 1
}

Write-Info "`n=========================================="
Write-Success "✓ Done! Repository is now on GitHub"
Write-Info "URL: https://github.com/$GitHubUsername/$RepositoryName"
Write-Info "=========================================="
