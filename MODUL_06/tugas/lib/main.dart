// Tetap memakai endpoint dari PDF; kegagalan jaringan ditampilkan dengan tombol Coba Lagi.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.client});
  final http.Client? client;
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Daftar Game FreeToGame',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      scaffoldBackgroundColor: Colors.grey.shade200,
    ),
    home: MyHomePage(client: client),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.client});
  final http.Client? client;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> data = [];
  bool loading = true;
  String? error;
  late final http.Client _client;

  @override
  void initState() {
    super.initState();
    _client = widget.client ?? http.Client();
    _ambilData();
  }

  @override
  void dispose() {
    if (widget.client == null) _client.close();
    super.dispose();
  }

  Future<void> _ambilData() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final response = await _client
          .get(Uri.parse('https://www.freetogame.com/api/games'))
          .timeout(const Duration(seconds: 15));
      if (response.statusCode != 200) {
        throw Exception('Server mengembalikan HTTP ${response.statusCode}');
      }
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is! List) {
        throw const FormatException('Respons game bukan daftar.');
      }
      // PDF memuat komentar "10", tetapi kode dan format laporannya memakai 20.
      final hasil = decoded
          .take(20)
          .map((e) => Map<String, dynamic>.from(e as Map))
          .toList();
      if (!mounted) return;
      setState(() {
        data = hasil;
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        loading = false;
        error =
            'Gagal memuat data. Periksa koneksi internet atau coba lagi.\n$e';
      });
    }
  }

  void _bacaInfo(Map<String, dynamic> game) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teks(game, 'title', 'Informasi Game'),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                '${teks(game, 'genre', '-')} • ${teks(game, 'platform', '-')}',
              ),
              const SizedBox(height: 8),
              Text('Tanggal rilis: ${teks(game, 'release_date', '-')}'),
              const SizedBox(height: 8),
              Text('Pengembang: ${teks(game, 'developer', '-')}'),
              const SizedBox(height: 12),
              Text(
                teks(game, 'short_description', 'Deskripsi belum tersedia.'),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget isi() {
    if (loading) return const Center(child: CircularProgressIndicator());
    if (error != null) {
      return Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.wifi_off, size: 48),
              const SizedBox(height: 12),
              Text(error!, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: _ambilData,
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
      );
    }
    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Belum ada data.'),
            TextButton(onPressed: _ambilData, child: const Text('Muat Ulang')),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final game = data[index];
        return _listItem(
          teks(game, 'thumbnail', ''),
          teks(game, 'title', 'Tidak ada judul'),
          teks(game, 'genre', 'Tidak ada genre'),
          teks(game, 'release_date', 'Tidak ada tanggal'),
          () => _bacaInfo(game),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Daftar Game FreeToGame'),
      backgroundColor: Colors.amber,
      actions: [
        IconButton(
          tooltip: 'Muat Ulang',
          onPressed: loading ? null : _ambilData,
          icon: const Icon(Icons.refresh),
        ),
      ],
    ),
    body: SafeArea(child: isi()),
  );
}

String teks(Map<String, dynamic> item, String key, String fallback) {
  final value = item[key];
  return value is String && value.trim().isNotEmpty ? value : fallback;
}

Widget gambar(String url) {
  Widget kosong() => const ColoredBox(
    color: Color(0xFFE0E0E0),
    child: Center(child: Icon(Icons.broken_image_outlined, color: Colors.grey)),
  );
  if (url.isEmpty) return kosong();
  return Image.network(
    url,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) => kosong(),
  );
}

// Fungsi di luar class sesuai pembagian pada modul.
Widget _tombolBaca(VoidCallback onPressed) => TextButton(
  onPressed: onPressed,
  style: TextButton.styleFrom(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  child: const Text('Baca Info'),
);

Container _listItem(
  String url,
  String judul,
  String genre,
  String rilis,
  VoidCallback onBaca,
) => Container(
  padding: const EdgeInsets.all(15),
  margin: const EdgeInsets.only(bottom: 10),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
  ),
  child: Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(width: 70, height: 70, child: gambar(url)),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            // Wrap mempertahankan semua informasi saat layar sempit atau teks membesar.
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(genre, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 2),
                    Text(rilis, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                _tombolBaca(onBaca),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
);
