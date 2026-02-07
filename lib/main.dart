import 'package:flutter/material.dart';

// تم تغيير اسم التطبيق برمجياً ليقبله الجوال كنسخة جديدة
void main() => runApp(const HudaProVersion()); 

class HudaProVersion extends StatelessWidget {
  const HudaProVersion({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هدى برو الاحترافي', // اسم جديد للهوية
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.dark, // الوضع الليلي لتمييزه عن القديم
        scaffoldBackgroundColor: const Color(0xFF001A1A), // لون خلفية ملكي
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الموسوعة الإسلامية الشاملة'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _menuCard(context, 'المصحف المسموع', Icons.audiotrack, Colors.amber),
                _menuCard(context, 'الموسوعة الحديثة', Icons.library_books, Colors.greenAccent),
                _menuCard(context, 'الرقية الشرعية', Icons.security, Colors.blueAccent),
                _menuCard(context, 'حصن المسلم', Icons.mosque, Colors.tealAccent),
                _menuCard(context, 'المسبحة الذكية', Icons.fingerprint, Colors.orangeAccent),
                _menuCard(context, 'اتجاه القبلة', Icons.explore, Colors.redAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.shade700),
      ),
      child: const Column(
        children: [
          Text('أوقات الصلاة اليوم', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('الفجر: 4:52'),
              Text('الظهر: 12:10'),
              Text('المغرب: 5:45'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () => _openFeature(context, title),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  void _openFeature(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('جاري فتح $title...'), duration: const Duration(seconds: 1)),
    );
  }
}
