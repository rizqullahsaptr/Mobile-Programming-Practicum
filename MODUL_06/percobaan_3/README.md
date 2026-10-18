# Modul 06 - Percobaan 3 - GridView.builder berita API

Proyek Flutter mandiri. Buka folder **percobaan_3** ini di Android Studio atau VS Code.

```powershell
flutter pub get
flutter run
```

Source code utama: `lib/main.dart`. Konfigurasi, dependensi, dan aset yang diperlukan sudah berada dalam proyek ini.

Untuk memeriksa proyek: `flutter analyze` dan `flutter test`.
Platform yang disiapkan: Android, iOS, dan web. Build iOS memerlukan macOS/Xcode; akses API di web mengikuti kebijakan CORS server.

## Catatan modul

Empat percobaan dipisah. GridView dibuat dapat digulir agar keenam item tetap dapat dilihat pada layar pendek (PDF menggunakan NeverScrollableScrollPhysics). Percobaan 3 dan 4 tetap memakai endpoint berita dari PDF. Jika server tidak tersedia, aplikasi menampilkan pesan kesalahan dan Coba Lagi, tanpa mengganti data API dengan data contoh. Tugas mengambil 20 game pertama: mengikuti kode take(20) dan format laporan PDF, meskipun satu komentar PDF menulis 10. Penamaan list data dibuat konsisten agar perbedaan dataBerita/dataGame pada contoh PDF tidak menyebabkan error. Tombol Baca Info membuka informasi game dari respons API.
