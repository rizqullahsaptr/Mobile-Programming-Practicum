import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(8, (i) => i);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Route App - Home'),
        backgroundColor: const Color(0xFF0081c9),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF0081c9),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text('Item ${index + 1}'),
              subtitle: const Text('Klik untuk melihat detail'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailPage.routeName,
                  arguments: DetailPageArgs(
                    title: 'Item ${index + 1}',
                    description:
                        'Ini adalah deskripsi lengkap untuk Item ${index + 1}. '
                        'Navigasi dilakukan dengan Navigator.pushNamed menggunakan '
                        'argument yang dikirim dari HomePage.',
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}