import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_06_tugas/main.dart' as app;

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
              jsonEncode([
                {
                  'title': 'Game Uji',
                  'thumbnail': '',
                  'genre': 'MMORPG',
                  'release_date': '2025-01-01',
                },
              ]),
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
