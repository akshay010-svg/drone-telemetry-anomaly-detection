# setup_repo.ps1
# Run this script from the project root (where code.ipynb, ReadMe.Md, Report.pdf exist)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "Creating repo structure..."

# Create directories
$dirs = @("data","notebooks","src","reports")
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Path $d -Force | Out-Null
}

# Move files if they exist
if (Test-Path -Path "code.ipynb") {
    Move-Item -Path "code.ipynb" -Destination "notebooks\code.ipynb" -Force
    Write-Host "Moved code.ipynb -> notebooks\code.ipynb"
} else {
    Write-Host "code.ipynb not found (ok if already moved)"
}

if (Test-Path -Path "Report.pdf") {
    Move-Item -Path "Report.pdf" -Destination "reports\Report.pdf" -Force
    Write-Host "Moved Report.pdf -> reports\Report.pdf"
} else {
    Write-Host "Report.pdf not found"
}

# Rename any ReadMe variants to README_original.md to preserve original
if (Test-Path -Path "ReadMe.Md") {
    Move-Item -Path "ReadMe.Md" -Destination "README_original.md" -Force
    Write-Host "Renamed ReadMe.Md -> README_original.md"
} elseif (Test-Path -Path "README.md") {
    Move-Item -Path "README.md" -Destination "README_original.md" -Force
    Write-Host "Renamed README.md -> README_original.md"
} else {
    Write-Host "No README found"
}

# Write .gitignore
@"
# Python
__pycache__/
*.pyc
.env
venv/
env/
.ipynb_checkpoints/
# Data (keep out of repo)
data/
*.csv
*.h5
*.pt
# OS
.DS_Store
Thumbs.db
# VSCode
.vscode/
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8

# Write requirements.txt
@"
numpy
pandas
scikit-learn
imbalanced-learn
xgboost
matplotlib
seaborn
jupyter
joblib
torch
tensorflow
"@ | Out-File -FilePath "requirements.txt" -Encoding UTF8

# Write a minimal README.md (you already have README_original.md to merge)
@"
# Drone Telemetry Anomaly Detection

**Authors:** Ritesh Singh, Arjit Tiwari, Ashutosh Singh, Akshay Naroliya

See `reports/Report.pdf` for the full writeup.
"@ | Out-File -FilePath "README.md" -Encoding UTF8

# Create a LICENSE stub if not present
if (-not (Test-Path -Path "LICENSE")) {
    @"
MIT License

Copyright (c) 2025

Replace this placeholder with the full MIT license text.
"@ | Out-File -FilePath "LICENSE" -Encoding UTF8
    Write-Host "Created LICENSE (placeholder)"
} else {
    Write-Host "LICENSE already exists"
}

# Initialize git and initial commit
if (-not (Test-Path -Path ".git")) {
    git init
    git add .
    git commit -m "Initial project structure: notebooks, reports, README, .gitignore, requirements"
    Write-Host "Git repository initialized and initial commit created."
} else {
    Write-Host "Git repository already exists - skipping git init."
}

Write-Host ""
Write-Host "Done. Next steps to push to GitHub (run these manually):"
Write-Host "  git remote add origin https://github.com/<your-github-username>/drone-telemetry-anomaly-detection.git"
Write-Host "  git branch -M main"
Write-Host "  git push -u origin main"
