import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flexible',
    home: const FlexiblePage(),
  );
}

class FlexiblePage extends StatefulWidget {
  const FlexiblePage({super.key});
  @override
  State<FlexiblePage> createState() => _FlexiblePageState();
}

class _FlexiblePageState extends State<FlexiblePage> {
  int variasi = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Flexible'),
      backgroundColor: Colors.amber,
    ),
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<int>(
              value: variasi,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text('e. Semua loose (flex 1 : 3 : 2)'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('g. Semua tight (flex 1 : 3 : 2)'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('i. Tight, tight, loose'),
                ),
              ],
              onChanged: (v) {
                if (v != null) setState(() => variasi = v);
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: variasi == 0 ? FlexFit.loose : FlexFit.tight,
                    child: const KotakBiruJempolKecil(),
                  ),
                  Flexible(
                    flex: 3,
                    fit: variasi == 0 ? FlexFit.loose : FlexFit.tight,
                    child: const KotakBiruJempolKecil(),
                  ),
                  Flexible(
                    flex: 2,
                    fit: variasi == 1 ? FlexFit.tight : FlexFit.loose,
                    child: const KotakBiruJempolKecil(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: 75,
    height: 75,
    decoration: BoxDecoration(
      color: Colors.blue,
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
  );
}
