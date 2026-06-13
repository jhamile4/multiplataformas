import 'package:flutter_test/flutter_test.dart';
import 'package:ventanita/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VentanitaApp());

    // Verify that our login page has 'Bienvenido'
    expect(find.text('Bienvenido'), findsOneWidget);
  });
}
