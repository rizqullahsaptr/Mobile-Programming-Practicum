import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Control Bar Musik',
    theme: ThemeData.dark(),
    home: const MusicPage(),
  );
}

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});
  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool playing = false;
  bool shuffle = false;
  bool repeat = false;
  void info(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(teks), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Text('Music App')),
    bottomNavigationBar: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: Colors.black54,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                tooltip: 'Shuffle',
                isSelected: shuffle,
                icon: const Icon(Icons.shuffle, color: Colors.white),
                onPressed: () {
                  setState(() => shuffle = !shuffle);
                  info(shuffle ? 'Shuffle aktif' : 'Shuffle nonaktif');
                },
              ),
            ),
            Expanded(
              child: IconButton(
                tooltip: 'Previous',
                icon: const Icon(Icons.skip_previous, color: Colors.white),
                onPressed: () => info('Lagu sebelumnya'),
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: IconButton(
                tooltip: playing ? 'Pause' : 'Play',
                icon: Icon(
                  playing ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  color: Colors.white,
                  size: 56,
                ),
                onPressed: () => setState(() => playing = !playing),
              ),
            ),
            Expanded(
              child: IconButton(
                tooltip: 'Next',
                icon: const Icon(Icons.skip_next, color: Colors.white),
                onPressed: () => info('Lagu berikutnya'),
              ),
            ),
            Expanded(
              child: IconButton(
                tooltip: 'Repeat',
                isSelected: repeat,
                icon: const Icon(Icons.repeat, color: Colors.white),
                onPressed: () {
                  setState(() => repeat = !repeat);
                  info(repeat ? 'Repeat aktif' : 'Repeat nonaktif');
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
