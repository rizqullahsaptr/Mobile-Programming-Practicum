// Program mandiri: jalankan dengan flutter run -t <path file ini>.
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Row dan Column',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas Row dan Column'),
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KotakFavorit(warna: Colors.blue, teks: 'Kotak 1'),
                  SizedBox(width: 20),
                  KotakFavorit(warna: Colors.lightBlue, teks: 'Kotak 2'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KotakFavorit(warna: Colors.cyan, teks: 'Kotak 3'),
                  SizedBox(width: 20),
                  KotakFavorit(warna: Colors.indigo, teks: 'Kotak 4'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KotakFavorit extends StatelessWidget {
  const KotakFavorit({super.key, required this.warna, required this.teks});
  final Color warna;
  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: warna,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, color: Colors.red, size: 40),
          const SizedBox(height: 8),
          Text(teks, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
