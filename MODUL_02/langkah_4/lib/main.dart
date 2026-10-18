// Program mandiri: jalankan dengan flutter run -t <path file ini>.
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Row and Column',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column'),
          backgroundColor: Colors.amber,
        ),
        body: const Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KotakBiruJempol(),
                SizedBox(width: 20),
                KotakBiruJempol(),
                SizedBox(width: 20),
                KotakBiruJempol(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Langkah 2: definisi widget. Baru ditampilkan pada Langkah 3.
class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.thumb_up, color: Colors.orange, size: 40),
    );
  }
}
