# Langkah Kerja Modul 12

Akses Lokasi dengan GPS di Flutter

## a. Membuat proyek

Buat proyek Flutter bernama lokasi_flutter. Folder proyek pada repository ini adalah langkah_kerja.

## b. Struktur folder

Kenali android/, lib/main.dart, pubspec.yaml. Proyek yang disediakan menargetkan Android untuk praktik GPS.

## c. Dependency

Tambahkan google_fonts, geolocator, geocoding; jalankan flutter pub get. Versi hasil resolusi disimpan dalam pubspec.lock.

## d. Permission Android

Tambahkan ACCESS_FINE_LOCATION dan ACCESS_COARSE_LOCATION di AndroidManifest.xml, di bawah manifest dan sebelum application. INTERNET mendukung pemuatan font.

## e. Import

Import Material, Google Fonts, Geolocator, dan Geocoding di main.dart.

## f. MyApp

Jalankan MyApp melalui runApp; gunakan MaterialApp dengan judul Lokasi Saya, tema indigo, font Poppins, dan home LocationScreen.

## g. Layar dan state

Buat LocationScreen StatefulWidget. Siapkan _kecamatan, _kota, _isLoading, _errorMessage.

## h. Fungsi _getLocation

Atur loading/reset data; periksa layanan GPS; periksa/minta permission; ambil Position; lakukan reverse geocoding; simpan alamat; tangani catch; hentikan loading dalam finally.

## i. Antarmuka

Scaffold, AppBar, Card, dan ElevatedButton menampilkan awal/loading/error/hasil. Tombol dinonaktifkan selama _isLoading true.

## j. Menjalankan dan mengamati

Jalankan di emulator atau perangkat Android, tekan TAMPILKAN LOKASI SAAT INI, izinkan lokasi, dan dokumentasikan empat kondisi sesuai tugas.

## Menjalankan

```bash
cd langkah_kerja
flutter pub get
flutter run
```

## Pemeriksaan

```bash
flutter analyze
flutter test
flutter build apk --debug
```

## Penyesuaian kompatibilitas

Flutter yang dipakai 3.47.1 dengan Dart 3.13.1. Dependency transitif path_provider_android dan path_provider_foundation dikunci melalui dependency_overrides untuk menghindari kegagalan hook native pada path Windows yang mengandung spasi. Berkas pubspec.lock disertakan. Pemeriksaan mounted ditambahkan sebelum pembaruan state/context setelah await.

Geolocator 7.7.1 dari rentang contoh PDF gagal build karena namespace Android belum tersedia. Geocoding 3.0.0 juga gagal pada pemeriksaan AAR karena compileSdk plugin 33, sehingga digunakan geocoding 4.0.0 dengan API pemanggilan yang sama. Implementasi memakai geolocator ^14.0.0 (teresolusi 14.1.2) dan LocationSettings untuk akurasi tinggi. Nama kelas LocationScreen diseragamkan karena PDF memakai dua nama berbeda. Alur fungsi, empat state, dan komponen UI tetap mengikuti modul. Lokasi emulator pada bukti merupakan koordinat simulasi, bukan lokasi fisik pengguna.

## Format laporan

Cover, Tujuan, Langkah Kerja Singkat, Screenshot dengan keterangan, dan Kesimpulan. Bukti serta hasil pengujian aktual dicatat dalam VERIFIKASI.md.
