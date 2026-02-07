import 'package:flutter/material.dart';

void main() => runApp(const HudaApp());

class HudaApp extends StatelessWidget {
  const HudaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تطبيق هدى - الإصدار الذهبي'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _prayerBanner(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              children: [
                _card(context, 'القرآن المسموع', Icons.audiotrack, const AudioQuran()),
                _card(context, 'الموسوعة الحديثة', Icons.auto_stories, const HadithEncyclopedia()),
                _card(context, 'الرقية الشرعية', Icons.health_and_safety, const RoqiaScreen()),
                _card(context, 'حصن المسلم', Icons.mosque, const AthkarList()),
                _card(context, 'المسبحة الذكية', Icons.fingerprint, const CounterScreen()),
                _card(context, 'اتجاه القبلة', Icons.explore, const QiblaScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _prayerBanner() => Container(
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.teal.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
    child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text('الفجر 4:50'), Text('الظهر 12:12'), Text('العصر 3:30'), Text('المغرب 5:50'),
    ]),
  );

  Widget _card(context, t, i, s) => Card(child: InkWell(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => s)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(i, size: 40, color: Colors.tealAccent),
      const SizedBox(height: 8),
      Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
    ]),
  ));
}

// --- ميزة الرقية الشرعية الجديدة ---
class RoqiaScreen extends StatelessWidget {
  const RoqiaScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('الرقية الشرعية')),
    body: ListView(
      padding: const EdgeInsets.all(15),
      children: const [
        Text('أعوذ بالله من الشيطان الرجيم', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        SizedBox(height: 10),
        Text('قراءة آية الكرسي، المعوذات، وأواخر سورة البقرة...', style: TextStyle(fontSize: 18), textAlign: TextAlign.right),
        Divider(),
        ListTile(leading: Icon(Icons.play_circle), title: Text('استماع للرقية الشرعية (بصوت مشاري العفاسي)')),
      ],
    ),
  );
}

// الأقسام الأساسية لضمان عمل التطبيق
class AudioQuran extends StatelessWidget { const AudioQuran({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القرآن المسموع'))); }
class HadithEncyclopedia extends StatelessWidget { const HadithEncyclopedia({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الموسوعة الحديثة'))); }
class AthkarList extends StatelessWidget { const AthkarList({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('حصن المسلم'))); }
class QiblaScreen extends StatelessWidget { const QiblaScreen({super.oy}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القبلة'))); }
class CounterScreen extends StatefulWidget { const CounterScreen({super.key}); @override State<CounterScreen> createState() => _CS(); }
class _CS extends State<CounterScreen> { int n = 0; @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المسبحة')), body: Center(child: Text('$n', style: const TextStyle(fontSize: 100)))); }
