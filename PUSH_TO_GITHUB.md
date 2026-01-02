# Cara Push ke GitHub

## Opsi 1: Install Git dan Push via Command Line

### Langkah 1: Install Git
1. Download Git dari: https://git-scm.com/download/win
2. Install dengan default settings
3. Restart terminal/command prompt

### Langkah 2: Push ke GitHub
Buka terminal di folder project dan jalankan:

```bash
# Inisialisasi git repository
git init

# Tambahkan remote repository
git remote add origin https://github.com/kkdev20/compoundingv1.git

# Tambahkan semua file
git add .

# Buat commit pertama
git commit -m "Initial commit: Compounding Interest Calculator with dark mode"

# Set branch ke main
git branch -M main

# Push ke GitHub
git push -u origin main
```

**Catatan:** Saat pertama kali push, GitHub akan meminta username dan password/token.

---

## Opsi 2: Menggunakan GitHub Desktop (Lebih Mudah)

1. Download GitHub Desktop: https://desktop.github.com/
2. Install dan login dengan akun GitHub (kuswiono.2013@gmail.com)
3. Di GitHub Desktop:
   - Klik **File** → **Add Local Repository**
   - Pilih folder: `C:\Users\n\Downloads\compouding`
   - Klik **Publish repository**
   - Repository: `compoundingv1`
   - Owner: `kkdev20`
   - ✅ Keep this code private (optional)
   - Klik **Publish Repository**

---

## Opsi 3: Upload Manual via Web (Jika Git tidak bisa diinstall)

1. Buka: https://github.com/kkdev20/compoundingv1
2. Klik **"uploading an existing file"** atau buat file README.md dulu
3. Upload file-file berikut (drag & drop):
   - Semua file di folder `src/`
   - `index.html`
   - `package.json`
   - `vite.config.js`
   - `tailwind.config.js`
   - `postcss.config.js`
   - `vercel.json`
   - `.gitignore`
   - `README.md`

**Catatan:** Opsi ini tidak recommended karena tidak termasuk folder `node_modules` (sudah benar, karena di .gitignore).

---

## Setelah Push Berhasil

Setelah code sudah di GitHub, langsung bisa deploy di Vercel:
1. Buka https://vercel.com
2. Login dengan GitHub
3. Import repository: kkdev20/compoundingv1
4. Klik Deploy!

