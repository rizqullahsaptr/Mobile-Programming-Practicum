import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul_06_percobaan_1/main.dart' as app;

void main() {
  testWidgets('Program dapat dibuka pada layar HP', (tester) async {
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final size in [const Size(360, 800), const Size(320, 640)]) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(const app.MyApp());
      await tester.runAsync(() async {
        final context = tester.element(find.byType(Scaffold));
        for (final name in [
          'boy',
          'timetable',
          'homeschooling',
          'clipboard',
          'marks',
          'pencil',
        ]) {
          await precacheImage(AssetImage('assets/icon/$name.png'), context);
        }
      });
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
    }
  });
}
