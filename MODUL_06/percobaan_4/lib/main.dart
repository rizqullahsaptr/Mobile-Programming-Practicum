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
    title: 'Demo ListView.builder',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      scaffoldBackgroundColor: null,
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
          .get(
            Uri.parse('https://jakpost.vercel.app/api/category/business/tech'),
          )
          .timeout(const Duration(seconds: 15));
      if (response.statusCode != 200) {
        throw Exception('Server mengembalikan HTTP ${response.statusCode}');
      }
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      if (decoded is! Map || decoded['posts'] is! List) {
        throw const FormatException(
          'Respons berita tidak memiliki daftar posts.',
        );
      }
      final hasil = (decoded['posts'] as List)
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
      itemCount: data.length,
      itemBuilder: (context, index) {
        final berita = data[index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              title: Text(
                teks(berita, 'title', 'Tidak ada judul'),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                teks(
                  berita,
                  'published_at',
                  teks(berita, 'pusblised_at', 'Tidak ada data'),
                ),
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
              ),
              leading: SizedBox(
                width: 85,
                height: 65,
                child: gambar(teks(berita, 'image', '')),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Demo ListView.builder'),
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
