@echo off
echo === Push ke GitHub ===
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git tidak ditemukan!
    echo.
    echo Silakan install Git terlebih dahulu:
    echo 1. Download dari: https://git-scm.com/download/win
    echo 2. Install dengan default settings
    echo 3. Restart terminal dan jalankan script ini lagi
    echo.
    echo Atau gunakan GitHub Desktop: https://desktop.github.com/
    pause
    exit /b
)

echo Git ditemukan!
echo.
echo Menjalankan git commands...
echo.

REM Initialize git if not already
if not exist .git (
    echo Inisialisasi git repository...
    git init
)

REM Add remote
echo Menambahkan remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/kkdev20/compoundingv1.git

REM Add all files
echo Menambahkan semua file...
git add .

REM Commit
echo Membuat commit...
git commit -m "Initial commit: Compounding Interest Calculator with dark mode and premium design"

REM Set branch to main
echo Set branch ke main...
git branch -M main

REM Push
echo.
echo Push ke GitHub...
echo Jika diminta, masukkan username dan password/token GitHub
echo.
git push -u origin main

echo.
echo === Selesai ===
echo Jika push berhasil, code sudah ada di GitHub!
pause

