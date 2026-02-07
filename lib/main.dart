import 'package:flutter/material.dart';

void main() {
  runApp(const HudaProApp());
}

class HudaProApp extends StatelessWidget {
  const HudaProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Huda Pro',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF011616),
      ),
      home: const MainDashboard(),
    );
  }
}

class MainDashboard extends StatelessWidget {
  const MainDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('هدى - الموسوعة الشاملة'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade900,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          _item(context, 'القرآن المسموع', Icons.mic_external_on, Colors.amber),
          _item(context, 'الموسوعة الحديثة', Icons.menu_book, Colors.green),
          _item(context, 'الرقية الشرعية', Icons.health_and_safety, Colors.blue),
          _item(context, 'أذكار المسلم', Icons.wb_sunny, Colors.orange),
          _item(context, 'المسبحة الإلكترونية', Icons.fingerprint, Colors.tealAccent),
          _item(context, 'اتجاه القبلة', Icons.explore, Colors.redAccent),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('جاري فتح $title...'))
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
