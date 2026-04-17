import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huda_pro/main.dart';

void main() {
  testWidgets('App loads and shows main categories', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HudaProHome()));
    expect(find.text('المصحف الشريف'), findsOneWidget);
    expect(find.text('موسوعة الأذكار'), findsOneWidget);
  });
}
