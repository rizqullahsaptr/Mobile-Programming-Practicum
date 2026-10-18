import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_06_percobaan_3/main.dart' as app;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  testWidgets('Program dapat dibuka pada layar HP', (tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final size in [const Size(360, 800), const Size(320, 640)]) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(
        app.MyApp(
          client: MockClient(
            (_) async => http.Response(
              jsonEncode({
                'posts': [
                  {
                    'title': 'Berita Uji',
                    'image': '',
                    'pusblised_at': '18 Oktober 2026',
                  },
                ],
              }),
              200,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    }
  });
}
