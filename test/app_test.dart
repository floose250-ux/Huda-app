import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_pro/main.dart';

void main() {
  testWidgets('HudaProHome renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    expect(find.text('هدى برو - الموسوعة الشاملة'), findsOneWidget);
    expect(find.text('المصحف الشريف'), findsOneWidget);
    expect(find.text('موسوعة الأذكار'), findsOneWidget);
    expect(find.text('جوامع الدعاء'), findsOneWidget);
    expect(find.text('الموسوعة الحديثية'), findsOneWidget);
    expect(find.byType(MainCard), findsNWidgets(4));
  });

  testWidgets('Navigation to AzkarCategoriesPage works', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));

    await tester.tap(find.text('موسوعة الأذكار'));
    await tester.pumpAndSettle();

    expect(find.text('موسوعة الأذكار'), findsOneWidget);
    expect(find.text('أذكار الصباح'), findsOneWidget);
    expect(find.text('أذكار المساء'), findsOneWidget);
  });
}
