import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProV1(), debugShowCheckedModeBanner: false));

class HudaProV1 extends StatefulWidget {
  const HudaProV1({super.key});
  @override
  _HudaProV1State createState() => _HudaProV1State();
}

class _HudaProV1State extends State<HudaProV1> {
  int _counter = 0; // ميزة عداد الاستغفار

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001212),
      appBar: AppBar(title: const Text('هدى برو - النسخة الآمنة'), backgroundColor: Colors.teal.shade900, centerTitle: true),
      body: Column(
        children: [
          _dailyChallenge(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 12, crossAxisSpacing: 12,
              children: [
                _card('المصحف', Icons.book, Colors.amber),
                _card('الأذكار', Icons.wb_sunny, Colors.orange),
                _card('القبلة', Icons.explore, Colors.redAccent),
                _card('المسبحة', Icons.fingerprint, Colors.tealAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dailyChallenge() => Container(
    margin: const EdgeInsets.all(20), padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(color: Colors.teal.shade800, borderRadius: BorderRadius.circular(25)),
    child: Column(
      children: [
        const Text('تحدي الاستغفار اليومي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        Text('$_counter', style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () => setState(() => _counter++),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          child: const Text('استغفر الآن', style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );

  Widget _card(String t, IconData i, Color c) => Card(
    color: const Color(0xFF002A2A),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, size: 45, color: c), Text(t, style: const TextStyle(color: Colors.white))]),
  );
}
