# Script untuk push ke GitHub
# Pastikan Git sudah terinstall sebelum menjalankan script ini

Write-Host "=== Push ke GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    $gitVersion = git --version
    Write-Host "Git ditemukan: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git tidak ditemukan!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Silakan install Git terlebih dahulu:" -ForegroundColor Yellow
    Write-Host "1. Download dari: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "2. Install dengan default settings" -ForegroundColor Yellow
    Write-Host "3. Restart terminal dan jalankan script ini lagi" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Atau gunakan GitHub Desktop: https://desktop.github.com/" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Menjalankan git commands..." -ForegroundColor Cyan
Write-Host ""

# Initialize git if not already
if (-not (Test-Path .git)) {
    Write-Host "Inisialisasi git repository..." -ForegroundColor Yellow
    git init
}

# Add remote
Write-Host "Menambahkan remote repository..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin https://github.com/kkdev20/compoundingv1.git

# Add all files
Write-Host "Menambahkan semua file..." -ForegroundColor Yellow
git add .

# Commit
Write-Host "Membuat commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Compounding Interest Calculator with dark mode and premium design"

# Set branch to main
Write-Host "Set branch ke main..." -ForegroundColor Yellow
git branch -M main

# Push
Write-Host ""
Write-Host "Push ke GitHub..." -ForegroundColor Yellow
Write-Host "Jika diminta, masukkan username dan password/token GitHub" -ForegroundColor Cyan
Write-Host ""
git push -u origin main

Write-Host ""
Write-Host "=== Selesai ===" -ForegroundColor Green
Write-Host "Jika push berhasil, code sudah ada di GitHub!" -ForegroundColor Green

