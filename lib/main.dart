import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaPro(), debugShowCheckedModeBanner: false));

class HudaPro extends StatelessWidget {
  const HudaPro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Huda Pro - الإصدار الجديد'), backgroundColor: Colors.teal),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _card('القرآن', Icons.book),
          _card('الأذكار', Icons.wb_sunny),
          _card('المسبحة', Icons.fingerprint),
          _card('القبلة', Icons.explore),
        ],
      ),
    );
  }
  Widget _card(String t, IconData i) => Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, size: 50, color: Colors.teal), Text(t)]));
}
