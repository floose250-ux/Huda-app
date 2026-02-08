import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));

class HudaProHome extends StatefulWidget {
  const HudaProHome({super.key});
  @override
  _HudaProHomeState createState() => _HudaProHomeState();
}

class _HudaProHomeState extends State<HudaProHome> {
  int _istighfarCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('هدى برو - النسخة النهائية'), backgroundColor: Colors.teal.shade900, centerTitle: true),
      body: Column(
        children: [
          _buildIstighfarBox(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 15, crossAxisSpacing: 15,
              children: [
                _menuCard('القرآن الكريم', Icons.menu_book, Colors.amber),
                _menuCard('أذكار اليوم', Icons.wb_sunny, Colors.orange),
                _menuCard('اتجاه القبلة', Icons.explore, Colors.redAccent),
                _menuCard('المسبحة', Icons.fingerprint, Colors.tealAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIstighfarBox() => Container(
    margin: const EdgeInsets.all(20), padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.teal.shade900, Colors.teal.shade600]), borderRadius: BorderRadius.circular(25)),
    child: Column(
      children: [
        const Text('تحدي الاستغفار اليومي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        Text('$_istighfarCount', style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: () => setState(() => _istighfarCount++),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, shape: const StadiumBorder()),
          child: const Text('استغفر الآن', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );

  Widget _menuCard(String t, IconData i, Color c) => Card(
    color: const Color(0xFF001F1F),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, size: 40, color: c), const SizedBox(height: 10), Text(t, style: const TextStyle(color: Colors.white))]),
  );
}
