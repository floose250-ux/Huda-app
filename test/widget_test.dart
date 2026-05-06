import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_pro/main.dart';

void main() {
  testWidgets('HudaProHome renders main cards', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    // Verify that our main categories are displayed.
    expect(find.text('المصحف الشريف'), findsOneWidget);
    expect(find.text('موسوعة الأذكار'), findsOneWidget);
    expect(find.text('جوامع الدعاء'), findsOneWidget);
    expect(find.text('الموسوعة الحديثية'), findsOneWidget);
  });

  testWidgets('Navigating to AzkarCategoriesPage works', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    // Tap on the Azkar card
    await tester.tap(find.text('موسوعة الأذكار'));
    await tester.pumpAndSettle();

    // Verify that AzkarCategoriesPage is shown
    expect(find.text('أذكار الصباح'), findsOneWidget);
    expect(find.text('أدعية السفر'), findsOneWidget);
  });
}
