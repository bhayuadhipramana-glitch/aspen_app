import 'package:flutter_test/flutter_test.dart';
import 'package:aspen_app/main.dart'; // Pastikan path ini sesuai dengan nama project kamu

void main() {
  testWidgets('Aspen Travel App smoke test', (WidgetTester tester) async {
    // Build aplikasi kita (AspenApp) dan trigger frame pertama
    await tester.pumpWidget(const AspenApp());

    // Verifikasi bahwa teks 'Aspen' dari SplashPage berhasil di-render
    // Menggunakan findsWidgets karena mungkin ada lebih dari 1 teks Aspen di tree
    expect(find.text('Aspen'), findsWidgets);
  });
}