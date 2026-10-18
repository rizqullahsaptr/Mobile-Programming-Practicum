import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Sedang memutar',
    theme: ThemeData.dark(),
    home: const MusicCardPage(),
  );
}

class MusicCardPage extends StatefulWidget {
  const MusicCardPage({super.key});
  @override
  State<MusicCardPage> createState() => _MusicCardPageState();
}

class _MusicCardPageState extends State<MusicCardPage> {
  bool disukai = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Sedang memutar'), centerTitle: true),
    body: Center(
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 120,
                child: Center(
                  child: Icon(Icons.album, size: 90, color: Colors.blueGrey),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Flexible(
                    flex: 6,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Di sini ada judul lagu',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Di sini ada nama artis',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: disukai ? 'Batal suka' : 'Suka',
                    icon: Icon(
                      disukai ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => setState(() => disukai = !disukai),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
