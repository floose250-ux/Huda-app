import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_pro/main.dart';

void main() {
  testWidgets('App structure and navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    // Verify that the main cards are present
    expect(find.text('المصحف الشريف'), findsOneWidget);
    expect(find.text('موسوعة الأذكار'), findsOneWidget);
    expect(find.text('جوامع الدعاء'), findsOneWidget);
    expect(find.text('الموسوعة الحديثية'), findsOneWidget);

    // Tap on 'موسوعة الأذكار' and trigger a frame.
    await tester.tap(find.text('موسوعة الأذكار'));
    await tester.pumpAndSettle();

    // Verify that we are on the AzkarCategoriesPage
    expect(find.text('أذكار الصباح'), findsOneWidget);
    expect(find.text('أذكار المساء'), findsOneWidget);
  });
}
