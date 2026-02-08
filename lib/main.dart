import 'package:flutter/material.dart';

// تم تغيير الهوية البرمجية لضمان عدم نزول النسخة القديمة
void main() => runApp(const MaterialApp(home: HudaProNew(), debugShowCheckedModeBanner: false));

class HudaProNew extends StatelessWidget {
  const HudaProNew({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000B0B), // خلفية سوداء ملكية
      appBar: AppBar(
        title: const Text('هدى برو - النسخة الجديدة'), 
        backgroundColor: Colors.teal.shade900,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          _buildItem('القرآن الكريم', Icons.menu_book, Colors.amber),
          _buildItem('الأذكار', Icons.wb_sunny, Colors.orange),
          _buildItem('المسبحة', Icons.fingerprint, Colors.tealAccent),
          _buildItem('القبلة', Icons.explore, Colors.redAccent),
          _buildItem('الموسوعة', Icons.library_books, Colors.green),
          _buildItem('الرقية', Icons.security, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildItem(String title, IconData icon, Color color) => Card(
    color: const Color(0xFF002424),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: color),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
