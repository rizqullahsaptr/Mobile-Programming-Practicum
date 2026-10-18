// Program mandiri: jalankan dengan flutter run -t <path file ini>.
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contoh SizedBox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh SizedBox'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kotakUji(Colors.amber),
                const SizedBox(width: 25, height: 25),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: kotakUji(Colors.green),
                ),
                const SizedBox(width: 25, height: 25),
                kotakUji(Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container kotakUji(Color warna) =>
    Container(height: 75, width: 75, color: warna);
