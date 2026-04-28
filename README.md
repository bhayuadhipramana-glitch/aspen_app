# Aspen Travel App - UI Slicing

Aplikasi ini adalah hasil implementasi desain antarmuka (UI Slicing) Aspen Travel App menggunakan Flutter. Proyek ini dibuat untuk memenuhi tugas pemrograman mobile dengan mengutamakan best practices dalam penggunaan widget layout.

## 📋 Informasi Mahasiswa
- **NAMA** : [Isi Nama Lengkap Anda]
- **NIM** : [Isi NIM Anda]
- **Kelas** : [Isi Kelas Anda, contoh: 4A/4B/4SIFORS]
- **Link Youtube (Unlisted)** : [Masukkan Link Video Presentasi PIP Anda]

## 🛠️ Konsep Layout yang Diterapkan
Sesuai dengan ketentuan tugas, aplikasi ini telah menerapkan 5 konsep dasar layouting Flutter:
1. **Row, Column, & Expanded**: Digunakan untuk membuat struktur responsif pada header, form pencarian, dan elemen detail harga.
2. **Padding & Margin**: Diterapkan menggunakan widget `Padding` dan `SizedBox` untuk menjaga konsistensi jarak (spacing) antar elemen UI.
3. **Stack & Positioned**: Dimanfaatkan secara intensif pada halaman Splash Screen dan visualisasi Card untuk menumpuk gambar background, gradient overlay, dan teks.
4. **ListView & GridView**: Digunakan pada Home Screen untuk menampilkan daftar kategori (horizontal scroll) dan rekomendasi destinasi (grid 2 kolom).
5. **MediaQuery**: Digunakan untuk memastikan aplikasi tetap responsif di berbagai ukuran layar dengan menghitung persentase lebar dan tinggi layar secara dinamis.

## 🚀 Cara Menjalankan Aplikasi
1. Pastikan Flutter SDK sudah terpasang.
2. Clone atau ekstrak direktori project ini.
3. Buka terminal pada root direktori project dan jalankan `flutter pub get`.
4. Jalankan aplikasi pada emulator atau real device menggunakan perintah `flutter run`.