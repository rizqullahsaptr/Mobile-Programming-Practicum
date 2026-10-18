# Modul 1-6 - Proyek Flutter mandiri

Terdapat **22 proyek Flutter mandiri**. Folder MODUL_01 sampai MODUL_06 hanya memuat folder langkah kerja/percobaan/tugas, mengikuti pola Modul 7.

```text
FLUTTER_MODUL_1_11/
  MODUL_01/  langkah_kerja/  tugas/
  MODUL_02/  langkah_1/  langkah_2/  langkah_3/  langkah_4/  langkah_5/  tugas/
  MODUL_03/  langkah_kerja/  tugas/
  MODUL_04/  percobaan_1/  percobaan_2/  tugas/
  MODUL_05/  percobaan_1/  percobaan_2/  percobaan_3/  tugas/
  MODUL_06/  percobaan_1/  percobaan_2/  percobaan_3/  percobaan_4/  tugas/
```

Setiap folder proyek mempunyai `lib/main.dart`, `pubspec.yaml`, `android/`, `ios/`, `web/`, `test/`, dan README sendiri. Dependensi dan aset disertakan hanya pada proyek yang memerlukannya.

## Cara buka

Buka salah satu folder proyek (misalnya MODUL_04/percobaan_1) di Android Studio atau VS Code, lalu:

```powershell
flutter pub get
flutter run
```

Tidak perlu memilih target Dart lain. Setiap proyek memakai entrypoint standar `lib/main.dart`.

## Daftar proyek

| Folder | Isi |
|---|---|
| `MODUL_01/langkah_kerja` | Langkah kerja - Hello World |
| `MODUL_01/tugas` | Tugas - Program Pertamaku |
| `MODUL_02/langkah_1` | Langkah 1 - Proyek awal |
| `MODUL_02/langkah_2` | Langkah 2 - Definisi widget kustom |
| `MODUL_02/langkah_3` | Langkah 3 - Menampilkan widget kustom |
| `MODUL_02/langkah_4` | Langkah 4 - Row |
| `MODUL_02/langkah_5` | Langkah 5 - Column |
| `MODUL_02/tugas` | Tugas - Grid favorit 2 x 2 |
| `MODUL_03/langkah_kerja` | Langkah kerja 1-9 - Semua variasi alignment |
| `MODUL_03/tugas` | Tugas - UI cuaca Malang |
| `MODUL_04/percobaan_1` | Percobaan 1 - Flexible |
| `MODUL_04/percobaan_2` | Percobaan 2 - Expanded |
| `MODUL_04/tugas` | Tugas - Control bar musik |
| `MODUL_05/percobaan_1` | Percobaan 1 - SizedBox |
| `MODUL_05/percobaan_2` | Percobaan 2 - Spacer |
| `MODUL_05/percobaan_3` | Percobaan 3 - Card lokasi wisata |
| `MODUL_05/tugas` | Tugas - Card musik |
| `MODUL_06/percobaan_1` | Percobaan 1 - GridView |
| `MODUL_06/percobaan_2` | Percobaan 2 - ListView |
| `MODUL_06/percobaan_3` | Percobaan 3 - GridView.builder berita API |
| `MODUL_06/percobaan_4` | Percobaan 4 - ListView.builder berita API |
| `MODUL_06/tugas` | Tugas - Daftar game FreeToGame API |

## Laporan

- [Video laporan Modul 1](https://www.youtube.com/watch?v=jphNNTbQy18&t=3s)
- [Video laporan Modul 2](https://youtu.be/2nSx8437e4k?si=JqD5uEtkP35oujxS)

PDF laporan Modul 10 dan 11 tersedia pada folder laporan masing-masing modul, dengan tautan di README profil.

Isi 22 source code dipertahankan byte-per-byte saat penataan. Catatan penyesuaian PDF, aset Material Icons, API, dan simulasi UI tetap tersedia di README proyek terkait. Hasil verifikasi penataan ada di VERIFIKASI_MODUL_1_6.md.
