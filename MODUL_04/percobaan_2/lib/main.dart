import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Expanded',
    home: const ExpandedPage(),
  );
}

class ExpandedPage extends StatefulWidget {
  const ExpandedPage({super.key});
  @override
  State<ExpandedPage> createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  int variasi = 3;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Expanded'),
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
                  child: Text('e/g. Ukuran normal tanpa pembungkus'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('f. Flexible tight 1 : Expanded 1'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('g. Flexible tight 1 : Expanded 2'),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('h. Flexible loose 1 : Expanded 2'),
                ),
              ],
              onChanged: (v) {
                if (v != null) setState(() => variasi = v);
              },
            ),
          ),
          Expanded(
            child: variasi == 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        _kotakUji(Colors.amber, 150, 'Normal'),
                        _kotakUji(Colors.green, 100, 'Flexible'),
                        _kotakUji(Colors.blue, 250, 'Expanded'),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      _kotakUji(Colors.amber, 150, 'Normal'),
                      Flexible(
                        fit: variasi == 3 ? FlexFit.loose : FlexFit.tight,
                        flex: 1,
                        child: _kotakUji(Colors.green, 100, 'Flexible'),
                      ),
                      Expanded(
                        flex: variasi == 1 ? 1 : 2,
                        child: _kotakUji(Colors.blue, 250, 'Expanded'),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    ),
  );
}

Container _kotakUji(Color warna, double tinggi, String teks) => Container(
  width: double.infinity,
  height: tinggi,
  color: warna,
  alignment: Alignment.center,
  child: Text(teks, style: const TextStyle(fontSize: 30, color: Colors.white)),
);
