import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Alignment',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    ),
    home: const AlignmentPage(),
  );
}

class AlignmentPage extends StatefulWidget {
  const AlignmentPage({super.key});
  @override
  State<AlignmentPage> createState() => _AlignmentPageState();
}

class _AlignmentPageState extends State<AlignmentPage> {
  int langkah = 9;
  bool column = false;
  MainAxisSize ukuran = MainAxisSize.max;
  MainAxisAlignment utama = MainAxisAlignment.spaceEvenly;
  CrossAxisAlignment silang = CrossAxisAlignment.center;
  bool contohSuhu = false;

  // Satu file menyimpan seluruh tahap dan pilihan variasinya agar dapat diamati.
  static const judulLangkah = [
    '1. Proyek awal',
    '2. Widget kotak 100',
    '3. Widget kotak 75',
    '4. Row tiga kotak',
    '5. MainAxisSize.max',
    '6. MainAxisSize.min',
    '7. MainAxisSize Column',
    '8. MainAxisAlignment',
    '9. CrossAxisAlignment',
  ];

  void pilihLangkah(int nilai) {
    setState(() {
      langkah = nilai;
      column = nilai == 7;
      ukuran = nilai == 6 ? MainAxisSize.min : MainAxisSize.max;
      utama = nilai >= 8
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.start;
      silang = CrossAxisAlignment.center;
      contohSuhu = false;
    });
  }

  Widget pilihan<T>(
    String label,
    T nilai,
    List<T> values,
    ValueChanged<T> ubah,
  ) {
    return Row(
      children: [
        SizedBox(width: 110, child: Text(label)),
        Expanded(
          child: DropdownButton<T>(
            value: nilai,
            isExpanded: true,
            items: values
                .map(
                  (v) => DropdownMenuItem(
                    value: v,
                    child: Text(
                      v is bool
                          ? (v ? 'Column' : 'Row')
                          : v.toString().split('.').last,
                    ),
                  ),
                )
                .toList(),
            onChanged: (v) {
              if (v != null) setState(() => ubah(v));
            },
          ),
        ),
      ],
    );
  }

  Widget hasil() {
    // Tahap 2 dan 3 menambah definisi class, belum mengganti body dari tahap 1.
    if (langkah <= 3) return const Center(child: Text('Hello, Flutter!'));
    if (contohSuhu && langkah == 9) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: silang,
          textBaseline: TextBaseline.alphabetic,
          children: const [
            Text('Suhu:', style: TextStyle(fontSize: 30)),
            Text('25\u00B0C', style: TextStyle(fontSize: 75)),
            Icon(Icons.sunny, color: Colors.amber, size: 45),
          ],
        ),
      );
    }
    final anak = <Widget>[
      const KotakBiruJempolKecil(),
      if (langkah <= 7)
        SizedBox(width: column ? 0 : 20, height: column ? 20 : 0),
      const KotakBiruJempol(),
      if (langkah <= 7)
        SizedBox(width: column ? 0 : 20, height: column ? 20 : 0),
      const KotakBiruJempolKecil(),
    ];
    return Center(
      child: column
          ? Column(
              mainAxisSize: ukuran,
              mainAxisAlignment: utama,
              crossAxisAlignment: silang,
              children: anak,
            )
          : Row(
              mainAxisSize: ukuran,
              mainAxisAlignment: utama,
              crossAxisAlignment: silang,
              children: anak,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final opsiSilang = [
      CrossAxisAlignment.start,
      CrossAxisAlignment.end,
      CrossAxisAlignment.center,
      CrossAxisAlignment.stretch,
      if (contohSuhu && !column) CrossAxisAlignment.baseline,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alignment'),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 0.42,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        DropdownButton<int>(
                          value: langkah,
                          isExpanded: true,
                          items: List.generate(
                            9,
                            (i) => DropdownMenuItem(
                              value: i + 1,
                              child: Text(judulLangkah[i]),
                            ),
                          ),
                          onChanged: (v) {
                            if (v != null) pilihLangkah(v);
                          },
                        ),
                        if (langkah >= 7)
                          pilihan('Susunan', column, [false, true], (v) {
                            column = v;
                            contohSuhu = false;
                            if (silang == CrossAxisAlignment.baseline) {
                              silang = CrossAxisAlignment.center;
                            }
                          }),
                        if (langkah >= 7)
                          pilihan(
                            'MainAxisSize',
                            ukuran,
                            MainAxisSize.values,
                            (v) => ukuran = v,
                          ),
                        if (langkah >= 8)
                          pilihan(
                            'Sumbu utama',
                            utama,
                            MainAxisAlignment.values,
                            (v) => utama = v,
                          ),
                        if (langkah == 9)
                          pilihan(
                            'Sumbu silang',
                            silang,
                            opsiSilang,
                            (v) => silang = v,
                          ),
                        if (langkah == 9)
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Contoh suhu dan baseline'),
                            value: contohSuhu,
                            onChanged: (v) => setState(() {
                              contohSuhu = v;
                              column = false;
                              silang = CrossAxisAlignment.center;
                            }),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: hasil(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Langkah 2: ukuran normal 100 x 100.
class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.blue,
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Icon(Icons.thumb_up, color: Colors.white, size: 40),
  );
}

// Langkah 3: ukuran lebih kecil 75 x 75.
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
