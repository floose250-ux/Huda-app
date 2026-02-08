import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaUltimateApp(), debugShowCheckedModeBanner: false));

class HudaUltimateApp extends StatelessWidget {
  const HudaUltimateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000F0F),
      appBar: AppBar(
        title: const Text('هدى برو - النسخة النهائية'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDailyGoal(), // الميزة الجديدة: هدف الحسنات اليومي
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _menuIcon(context, 'القرآن الكريم', Icons.menu_book, Colors.amber),
                _menuIcon(context, 'أذكار اليوم', Icons.wb_sunny, Colors.orange),
                _menuIcon(context, 'المسبحة الذكية', Icons.fingerprint, Colors.tealAccent),
                _menuIcon(context, 'اتجاه القبلة', Icons.explore, Colors.redAccent),
                _menuIcon(context, 'أقرب مسجد', Icons.location_on, Colors.greenAccent),
                _menuIcon(context, 'عن التطبيق', Icons.info, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyGoal() => Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal.shade700, Colors.teal.shade400]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          children: [
            Text('حصاد الحسنات اليومي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text('قال ﷺ: "كلمتان خفيفتان على اللسان، ثقيلتان في الميزان: سبحان الله وبحمده، سبحان الله العظيم"', 
                 textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
      );

  Widget _menuIcon(BuildContext context, String title, IconData icon, Color color) => Card(
        color: const Color(0xFF002424),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 45, color: color),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
}
