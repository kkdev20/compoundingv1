# Aplikasi Compounding Interest Calculator

Aplikasi web untuk menghitung bunga majemuk (compounding interest) harian menggunakan Vue.js dengan desain premium dan dark mode.

## Fitur

- 💰 Input modal awal dengan format ribuan (default: 100.000 IDR)
- 📊 Input persentase harian (dinamis, default: 5%)
- 📅 Input periode dalam hari (dinamis, default: 10 hari)
- 📈 Perhitungan bunga majemuk harian
- 📋 Tabel detail per hari
- 💵 Ringkasan total keuntungan dan ROI
- 🌙 Dark Mode & Light Mode dengan toggle
- 🎨 Desain premium dengan Tailwind CSS
- 📱 Responsive design

## Cara Menjalankan

1. Install dependencies:
```bash
npm install
```

2. Jalankan development server:
```bash
npm run dev
```

3. Buka browser dan akses URL yang ditampilkan (biasanya http://localhost:5173)

## Build untuk Production

```bash
npm run build
```

File hasil build akan ada di folder `dist`.

## Deploy ke Vercel

Aplikasi sudah siap untuk deploy ke Vercel:

1. **Via GitHub (Recommended):**
   - Push code ke GitHub repository
   - Buka [vercel.com](https://vercel.com)
   - Login dengan GitHub
   - Klik "New Project"
   - Import repository yang sudah di-push
   - Vercel akan auto-detect Vite dan mengkonfigurasi otomatis
   - Klik "Deploy"

2. **Via Vercel CLI:**
   ```bash
   npm i -g vercel
   vercel
   ```

## Teknologi

- Vue.js 3
- Vite
- Tailwind CSS 3
- PostCSS & Autoprefixer

## Contoh Penggunaan

- Modal: 100.000 IDR
- Persentase Harian: 5%
- Periode: 10 hari

Aplikasi akan menghitung bunga majemuk setiap hari dan menampilkan hasil akhir beserta detail per hari.

## License

© 2024 wistack.site

