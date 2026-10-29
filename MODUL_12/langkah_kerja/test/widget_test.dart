import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lokasi_flutter/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('flutter.baseflow.com/geolocator');

  testWidgets(
    'GPS tidak aktif menampilkan error dan mengaktifkan kembali tombol',
    (tester) async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            if (call.method == 'isLocationServiceEnabled') return false;
            throw MissingPluginException();
          });
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(channel, null),
      );
      await tester.pumpWidget(const MaterialApp(home: LocationScreen()));
      expect(
        find.text('Tekan tombol untuk menampilkan lokasi.'),
        findsOneWidget,
      );
      await tester.tap(find.text('TAMPILKAN LOKASI SAAT INI'));
      await tester.pumpAndSettle();
      expect(
        find.text('Layanan lokasi tidak aktif. Mohon aktifkan GPS.'),
        findsOneWidget,
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNotNull,
      );
    },
  );
}
