import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Cuaca Malang',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
    ),
    home: const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Malang', style: TextStyle(fontSize: 30)),
            Text('25°', style: TextStyle(fontSize: 100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Prakiraan(hari: 'Minggu', icon: Icons.sunny, suhu: '20°C'),
                Prakiraan(
                  hari: 'Senin',
                  icon: Icons.cloudy_snowing,
                  suhu: '23°C',
                ),
                Prakiraan(hari: 'Selasa', icon: Icons.cloud, suhu: '22°C'),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class Prakiraan extends StatelessWidget {
  const Prakiraan({
    super.key,
    required this.hari,
    required this.icon,
    required this.suhu,
  });
  final String hari;
  final IconData icon;
  final String suhu;
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(hari),
      const SizedBox(height: 12),
      Icon(icon, size: 36),
      const SizedBox(height: 12),
      Text(suhu),
    ],
  );
}
