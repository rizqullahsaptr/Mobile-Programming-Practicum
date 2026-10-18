// Program mandiri: jalankan dengan flutter run -t <path file ini>.
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contoh Spacer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Spacer'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Row(
            children: [
              kotakUji(Colors.amber),
              const Spacer(flex: 1),
              SizedBox(width: 100, height: 100, child: kotakUji(Colors.green)),
              const Spacer(flex: 2),
              kotakUji(Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

Container kotakUji(Color warna) =>
    Container(height: 75, width: 75, color: warna);
