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
      appBar: AppBar(title: const Text('تطبيق هدى - الإصدار الشامل'), centerTitle: true),
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
                _card(context, 'أذكار حصن المسلم', Icons.mosque, const AthkarList()),
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
      Text('الفجر 4:52'), Text('الظهر 12:10'), Text('العصر 3:25'), Text('المغرب 5:45'),
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

// الأقسام المضافة (الرقية، الأذكار، الموسوعة)
class AudioQuran extends StatelessWidget { const AudioQuran({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القرآن المسموع'))); }
class HadithEncyclopedia extends StatelessWidget { const HadithEncyclopedia({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الموسوعة الحديثة'))); }
class RoqiaScreen extends StatelessWidget { const RoqiaScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الرقية الشرعية'))); }
class AthkarList extends StatelessWidget { const class AthkarList extends StatelessWidget {
  const AthkarList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أذكار حصن المسلم')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _athkarTile(context, 'أذكار الصباح', 'أصبحنا وأصبح الملك لله، والحمد لله...'),
          _athkarTile(context, 'أذكار المساء', 'أمسينا وأمسى الملك لله، والحمد لله...'),
          _athkarTile(context, 'أذكار النوم', 'باسمك ربي وضعت جنبي وبك أرفعه...'),
        ],
      ),
    );
  }

  Widget _athkarTile(BuildContext context, String title, String content) => Card(
    child: ListTile(
      leading: const Icon(Icons.wb_sunny, color: Colors.orangeAccent),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () => showDialog(
        context: context,
        builder: (c) => AlertDialog(
          title: Text(title),
          content: Text(content, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
          actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('إغلاق'))],
        ),
      ),
    ),
  );
}
({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('حصن المسلم'))); }
class QiblaScreen extends StatelessWidget { const QiblaScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القبلة'))); }
class CounterScreen extends StatefulWidget { const CounterScreen({super.key}); @override State<CounterScreen> createState() => _CS(); }
class _CS extends State<CounterScreen> { int n = 0; @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المسبحة')), body: Center(child: Text('$n', style: const TextStyle(fontSize: 100)))); }
