# Cara Deploy ke Vercel

Aplikasi sudah siap untuk deploy! Ikuti langkah-langkah berikut:

## 1. Push ke GitHub

Pastikan Git sudah terinstall, lalu jalankan:

```bash
# Inisialisasi git (jika belum)
git init

# Tambahkan remote repository
git remote add origin https://github.com/kkdev20/compoudingv1.git

# Tambahkan semua file
git add .

# Commit
git commit -m "Initial commit: Compounding Interest Calculator"

# Push ke GitHub
git push -u origin main
```

Jika branch utama adalah `master` bukan `main`, ganti `main` dengan `master`.

## 2. Deploy via Vercel Dashboard

1. Buka [vercel.com](https://vercel.com)
2. Login dengan GitHub account (kuswiono.2013@gmail.com)
3. Klik **"Add New..."** → **"Project"**
4. Import repository: **kkdev20/compoudingv1**
5. Vercel akan auto-detect:
   - Framework: Vite
   - Build Command: `npm run build`
   - Output Directory: `dist`
6. Klik **"Deploy"**
7. Tunggu proses build selesai (sekitar 1-2 menit)
8. Aplikasi akan live di URL yang diberikan Vercel!

## 3. (Opsional) Deploy via Vercel CLI

```bash
# Install Vercel CLI
npm i -g vercel

# Login
vercel login

# Deploy
vercel

# Untuk production
vercel --prod
```

## Catatan Penting

✅ Build sudah di-test dan berhasil  
✅ File `vercel.json` sudah dikonfigurasi  
✅ `.gitignore` sudah benar  
✅ Dependencies sudah lengkap  
✅ Semua file penting sudah ada  

## Setelah Deploy

Setelah deploy berhasil, aplikasi akan otomatis:
- Deploy ulang setiap ada push ke GitHub (auto-deploy)
- Dapat diakses via URL yang diberikan Vercel
- Support HTTPS secara default
- Global CDN untuk performa cepat

Selamat deploy! 🚀

