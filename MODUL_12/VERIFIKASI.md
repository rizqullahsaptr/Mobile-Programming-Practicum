# Verifikasi Modul 12

Tanggal: 30 Oktober 2026. Pemeriksaan dilakukan oleh agen pada emulator, bukan uji pengguna.

## Lingkungan

- Flutter 3.47.1, Dart 3.13.1.
- Medium_Phone, Android API 37, x86_64, 1080 × 2400.
- Target pemeriksaan: Android; source inti mengikuti langkah kerja PDF.

## Hasil aktual

- `flutter analyze --no-pub`: No issues found.
- `flutter test --no-pub`: 1 tes lulus.
- `flutter build apk --debug --no-pub`: berhasil.
- APK debug dipasang dan aplikasi dijalankan di emulator.
- UI awal, spinner dan tombol nonaktif, hasil geocoding, serta error GPS nonaktif diperiksa dan ditangkap.
- Koordinat emulator dikirim melalui `geo fix 112.6265 -7.9819`: koordinat simulasi, bukan posisi fisik pengguna.
- Respons alamat yang terlihat: Kauman dan Kota Malang.
- Permission coarse/fine diberikan ke aplikasi emulator melalui ADB sebelum uji sukses. Ini bukan bukti interaksi manusia pada dialog permission.
- Layanan lokasi dimatikan sementara untuk uji error, lalu diaktifkan kembali.
- Tes widget menggunakan layanan GPS mock nonaktif, terpisah dari screenshot runtime aktual.

## Penyesuaian dan batasan

- Rincian versi dan penyesuaian kode ada pada LANGKAH_KERJA.md dan laporan Word.
- Lingkungan eksekusi desktop memerlukan socket Java pada folder workspace (`jdk.net.unixdomain.tmpdir`) untuk melewati kegagalan virtualisasi path sementara. Ini opsi proses pengujian, bukan perubahan keamanan Windows atau fitur aplikasi.
- Belum ada uji perangkat Android fisik, iOS, pengukuran performa, atau pengumpulan LMS.

## Integritas screenshot

- `01_awal.png` SHA-256 `a2b271faf41f44b9c5dc39d4df0d8a8e4d27223dba95125124494b4933098ae1`
- `02_loading.png` SHA-256 `b6ac37e77765cbb2b893a38949e9d95087af4c4632796e716f6238fe2d4599d0`
- `03_berhasil.png` SHA-256 `a77a54fe2b4c304840cef75fca1f1814c92e8d90dce38759b44c583393fd47dc`
- `04_error.png` SHA-256 `d45f2389085f5b8b0d55d65eab7bf6e9d653fc4c4b7473f85b4124113a8eb91a`
