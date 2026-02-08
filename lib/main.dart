import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: HudaProHome(),
      debugShowCheckedModeBanner: false,
    ));

class HudaProHome extends StatefulWidget {
  const HudaProHome({super.key});
  @override
  _HudaProHomeState createState() => _HudaProHomeState();
}

class _HudaProHomeState extends State<HudaProHome> {
  int _count = 0; // عداد الاستغفار

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D), // الخلفية السوداء الفخمة
      appBar: AppBar(
        title: const Text('هدى برو - النسخة النهائية'),
        backgroundColor: Colors.teal.shade900,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // صندوق التحدي اليومي
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.teal.shade900, Colors.teal.shade600]),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Text('تحدي الاستغفار اليومي',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                const SizedBox(height: 10),
                Text('$_count',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => setState(() => _count++),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: const StadiumBorder()),
                  child: const Text('استغفر الآن',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          // شبكة الخدمات
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _card('القرآن الكريم', Icons.menu_book, Colors.amber),
                _card('أذكار اليوم', Icons.wb_sunny, Colors.orange),
                _card('اتجاه القبلة', Icons.explore, Colors.redAccent),
                _card('المسبحة', Icons.fingerprint, Colors.tealAccent),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _card(String t, IconData i, Color c) => Card(
        color: const Color(0xFF001F1F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(i, size: 40, color: c),
            const SizedBox(height: 10),
            Text(t, style: const TextStyle(color: Colors.white)),
          ],
        ),
      );
}
