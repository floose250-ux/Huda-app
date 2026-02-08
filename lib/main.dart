import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProFinal(), debugShowCheckedModeBanner: false));

class HudaProFinal extends StatelessWidget {
  const HudaProFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF011212), // لون خلفية عميق وفخم
      appBar: AppBar(
        title: const Text('هدى برو - الإصدار المطور'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الميزة الجديدة: آية اليوم
            _buildDailyVerse(),
            
            // شبكة الخدمات
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildCard(context, 'القرآن الكريم', Icons.menu_book, Colors.amber),
                _buildCard(context, 'أذكار الصباح', Icons.wb_sunny, Colors.orange),
                _buildCard(context, 'المسبحة الذكية', Icons.fingerprint, Colors.tealAccent),
                _buildCard(context, 'اتجاه القبلة', Icons.explore, Colors.redAccent),
                _buildCard(context, 'حصن المسلم', Icons.security, Colors.blue),
                _buildCard(context, 'أوقات الصلاة', Icons.access_time, Colors.greenAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ميزة آية اليوم الجديدة
  Widget _buildDailyVerse() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.teal.shade800, Colors.teal.shade500]),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)],
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Icon(Icons.format_quote, color: Colors.white70),
              SizedBox(width: 10),
              Text('آية اليوم', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          SizedBox(height: 10),
          Text(
            ' "وَاسْتَعِينُوا بِالصَّبْرِ وَالصَّلَاةِ ۚ وَإِنَّهَا لَكَبِيرَةٌ إِلَّا عَلَى الْخَاشِعِينَ" ',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16, fontStyle: FontStyle.italic, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      color: const Color(0xFF002424),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
