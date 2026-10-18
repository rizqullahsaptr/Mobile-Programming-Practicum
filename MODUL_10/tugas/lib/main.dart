import 'package:flutter/material.dart';

import 'home_page.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Modul 10 - Named Route App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0081c9),
        ),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as DetailPageArgs;
          return DetailPage(
            title: args.title,
            description: args.description,
          );
        },
      },
    );
  }
}