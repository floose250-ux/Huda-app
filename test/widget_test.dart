import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_pro/main.dart';

void main() {
  testWidgets('Smoke test: Verify home page loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    expect(find.text('هدى برو - الموسوعة الشاملة'), findsOneWidget);
    expect(find.text('المصحف الشريف'), findsOneWidget);
    expect(find.text('موسوعة الأذكار'), findsOneWidget);
  });

  testWidgets('Navigation test: Go to Azkar Categories', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    await tester.tap(find.text('موسوعة الأذكار'));
    await tester.pumpAndSettle();

    expect(find.text('موسوعة الأذكار'), findsAtLeastNWidgets(1));
    expect(find.text('أذكار الصباح'), findsOneWidget);
  });
}
