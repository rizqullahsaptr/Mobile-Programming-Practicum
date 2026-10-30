# Verifikasi Modul 13

Tanggal: 30 Oktober 2026. Pemeriksaan dilakukan oleh agen pada emulator, bukan uji pengguna.

## Lingkungan

- Flutter 3.47.1, Dart 3.13.1.
- Medium_Phone, Android API 37, x86_64, 1080 × 2400.
- Target pemeriksaan: Android; source inti mengikuti langkah kerja PDF.

## Hasil aktual

- `flutter analyze --no-pub`: No issues found.
- `flutter test --no-pub`: 2 tes lulus.
- `flutter build apk --debug --no-pub`: berhasil.
- APK debug dipasang dan aplikasi dijalankan di emulator.
- POST aktual ke JSONPlaceholder: Card menampilkan Budi, Programmer, id 101, userID 1.
- PUT aktual ke /posts/1: Card menjadi Budi, Mobile Developer, id 1; SnackBar sukses hijau terlihat.
- Dialog konfirmasi hapus diperiksa; DELETE aktual mengembalikan tampilan awal dan notifikasi sukses.
- Wi-Fi/data emulator dimatikan sementara untuk request gagal. Screenshot menangkap SnackBar merah dengan kegagalan lookup host; jaringan kemudian diaktifkan kembali.
- Tes otomatis memeriksa parsing Post, userId default, dan waktu lokal. Tes tersebut tidak diklaim menguji server.
- Data input adalah contoh. JSONPlaceholder tidak menyimpan perubahan secara permanen.

## Penyesuaian dan batasan

- Rincian versi dan penyesuaian kode ada pada LANGKAH_KERJA.md dan laporan PDF.
- Lingkungan eksekusi desktop memerlukan socket Java pada folder workspace (`jdk.net.unixdomain.tmpdir`) untuk melewati kegagalan virtualisasi path sementara. Ini opsi proses pengujian, bukan perubahan keamanan Windows atau fitur aplikasi.
- Belum ada uji perangkat Android fisik, iOS, pengukuran performa, atau pengumpulan LMS.

## Integritas screenshot

- `01_awal.png` SHA-256 `9523dbe077f354e20a6fb2fa70afcf7988b7d4887424816ed107a88d4bbf9bc8`
- `02_tambah.png` SHA-256 `9d28d4d093f03e1aa58aa5e4384c0b6e48270aee3f4e16d26de46ff7be650d38`
- `03_card.png` SHA-256 `b17083ec1f719fb6ea5633f94d4ad9edd39ec5d3d7881188006026c9a25be0b5`
- `04_update_dialog.png` SHA-256 `66ee96c38de29873ccac8c21442d950c375612adaa3f7dff0ed740854e96de08`
- `05_update_sukses.png` SHA-256 `4c51a3aace2a9b5a6e8b843ba2a9b0376e7fb9eecb18fe871316c32222f193bd`
- `06_konfirmasi_hapus.png` SHA-256 `41a78fc23d32d38f927b5cbe14085ebb6429d728353e0289cc616066836e0dd3`
- `07_hapus_sukses.png` SHA-256 `82ca24b17ac30e2162b66d10956b8a98005941897915caf2be0553b086247f9f`
- `08_error.png` SHA-256 `9db0c854661f4e82f0add7d958f0e60da91a3ecc303efd8991c4254ba7ad16d9`

Screenshot 05 dan 07 menggunakan tangkapan sesi awal yang tersimpan dalam PDF QA, lalu diekstrak kembali tanpa mengubah isi tampilan (709 × 1575). Screenshot lain ditangkap langsung pada 1080 × 2400. Bukti merupakan beberapa percobaan pada source yang sama, bukan rekaman satu urutan waktu tanpa jeda.
