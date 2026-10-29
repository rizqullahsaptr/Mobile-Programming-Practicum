# Langkah Kerja Modul 13

Operasi CRUD di Flutter dengan REST API

## a. Membuat proyek

Buat proyek flutter_crud_api; pada repository ini ditempatkan di langkah_kerja.

## b. Struktur

Kenali android/, lib/main.dart, dan pubspec.yaml.

## c. Dependency

Tambahkan http, intl, google_fonts, lalu jalankan flutter pub get.

## d. Import

Import Material, http dengan alias http, dart:convert, intl, dan Google Fonts.

## e. Aplikasi utama

MyApp mengatur MaterialApp, tema indigo, font Montserrat, halaman HomePage, dan debugShowCheckedModeBanner false.

## f. Model Post

Definisikan id, userId, title, body, createdAt dan factory Post.fromJson. userId default 1; createdAt dari DateTime.now().

## g. HomePage

Gunakan StatefulWidget dengan Post? createdPost, teks awal, Scaffold/AppBar, dan FloatingActionButton.

## h. createPost

Kirim POST /posts dengan header JSON dan payload title/body/userId 1; status 201 mengisi createdPost dari respons.

## i. Dialog tambah

Buat showAddPostDialog dengan TextField Nama dan Pekerjaan, controller, trim, validasi wajib isi, Batal dan Simpan.

## j. Hubungkan FAB

onPressed pada FAB memanggil showAddPostDialog.

## k. Tampilan Card

Jika createdPost null, tampilkan teks awal. Selain itu tampilkan Card berisi title, body, id, userID, dan tanggal.

## l. Coba tambah

Jalankan aplikasi, tekan +, isi Nama/Pekerjaan, Simpan, amati Card.

## m. updatePost

Sesuai modul, PUT diarahkan ke /posts/1 dan payload id 1. Status 200 memperbarui objek sambil mempertahankan createdAt.

## n. Dialog update

showUpdatePostDialog mengisi controller dengan data lama; validasi lalu jalankan updatePost.

## o. Menu pada Card

Judul dibungkus Expanded dalam Row bersama PopupMenuButton berisi Update dan Delete.

## p. Coba update

Tambahkan data, buka menu tiga titik, pilih Update, ubah isian, lalu amati Card dan notifikasi.

## q. deletePost

Kirim DELETE /posts/$id; status 200 mengatur createdPost null dan menampilkan SnackBar hijau; gagal/error merah.

## r. Konfirmasi hapus

Buat showDeleteConfirmationDialog; Batal hanya menutup dialog, Hapus menutup dialog dan memanggil deletePost.

## s. Hubungkan menu Delete

Lengkapi onSelected agar Delete membuka konfirmasi untuk id post aktif.

## t. Coba alur lengkap

Jalankan create, tampilan/read, update, delete; ambil screenshot awal, dialog, Card, dan notifikasi sukses/gagal.

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

Update tetap memakai ID 1 sesuai langkah m PDF. Read berupa tampilan respons API, tanpa tambahan request GET. JSONPlaceholder memberi respons simulasi: POST/PUT/DELETE tidak menyimpan perubahan permanen. createdAt merupakan waktu lokal; WIB pada format tanggal adalah literal. SnackBar error diatur merah sesuai format laporan. withValues(alpha: 0.3) menggantikan withOpacity(0.3) tanpa mengubah warna bayangan.

## Format laporan

Cover, Tujuan, Langkah Kerja Singkat, Screenshot dengan keterangan, dan Kesimpulan. Bukti serta hasil pengujian aktual dicatat dalam VERIFIKASI.md.
