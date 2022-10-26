import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/main.dart' as app;

void main() {
  group('My users', () {
    testWidgets('renders app', (tester) async {
      await tester.pumpApp();

      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }
}