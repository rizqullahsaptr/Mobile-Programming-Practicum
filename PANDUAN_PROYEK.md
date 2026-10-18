# FLUTTER_MODUL_1_11

35 proyek Flutter mandiri: 22 proyek Modul 1–6 dan 13 proyek Modul 7–11.
Setiap folder paling dalam bisa dibuka sendiri di Android Studio / VS Code.

## Cara buka

Android Studio → Open → pilih salah satu leaf folder, contoh:

```
FLUTTER_MODUL_1_11/MODUL_07/percobaan_1
```

lalu `flutter run`.

## Proyek Modul 1-6

[Panduan dan daftar lengkap Modul 1-6](README_MODUL_1_6.md)

| Modul | Subfolder proyek |
|---|---|
| MODUL_01 | langkah_kerja, tugas |
| MODUL_02 | langkah_1, langkah_2, langkah_3, langkah_4, langkah_5, tugas |
| MODUL_03 | langkah_kerja (gabungan sembilan langkah), tugas |
| MODUL_04 | percobaan_1, percobaan_2, tugas |
| MODUL_05 | percobaan_1, percobaan_2, percobaan_3, tugas |
| MODUL_06 | percobaan_1, percobaan_2, percobaan_3, percobaan_4, tugas |

Setiap subfolder di atas merupakan proyek lengkap dengan `lib/main.dart` dan `pubspec.yaml` sendiri. Jalankan `flutter run` dari subfolder proyek tersebut.

## Proyek Modul 7-11

| Folder | Isi |
|---|---|
| MODUL_07/percobaan_1 | MaterialPageRoute (`demo_navigasi_pageroute`) |
| MODUL_07/percobaan_2 | Named Route (`demo_navigasi`) |
| MODUL_07/tugas | Named Route 2 halaman |
| MODUL_08/langkah_kerja | Named Route + ScreenArguments |
| MODUL_08/tugas | FreeToGame API + argument |
| MODUL_09/percobaan_1 | Counter App (setState) |
| MODUL_09/percobaan_2 | Like Button |
| MODUL_09/tugas | Tasbih Digital + circular progress |
| MODUL_10/tahap_1 | Game list Home (MVVM) |
| MODUL_10/tahap_2 | Home + Detail + json_serializable |
| MODUL_10/tugas | Named route demo (laporan → app runnable) |
| MODUL_11/langkah_kerja | Tasbih GetX |
| MODUL_11/tugas | getx_app (laporan → app runnable) |

## Catatan sumber

- Repo GitHub `uqifumi` berisi contoh terpisah, bukan PDF modul. Implementasi mengikuti PDF Modul 07–11.
- Modul 10 & 11 tugas di PDF adalah laporan tertulis. Project-nya tetap dibuat runnable sesuai petunjuk format laporan (named_route_app / getx_app).
- Modul 10 package name di `pubspec.yaml` = `game_app` (sesuai import `package:game_app/...` di PDF), meski folder-nya `tahap_1` / `tahap_2`.
