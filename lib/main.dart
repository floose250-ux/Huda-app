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
      appBar: AppBar(title: const Text('تطبيق هدى - النسخة الصوتية'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _prayerBanner(), // عرض مواقيت الصلاة
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              children: [
                _card(context, 'القرآن المسموع', Icons.audiotrack, const AudioQuran()),
                _card(context, 'البحث في الآيات', Icons.search, const SearchScreen()),
                _card(context, 'تفسير القرآن', Icons.auto_stories, const TafseerList()),
                _card(context, 'حصن المسلم', Icons.mosque, const AthkarList()),
                _card(context, 'اتجاه القبلة', Icons.explore, const QiblaScreen()),
                _card(context, 'المسبحة الذكية', Icons.fingerprint, const CounterScreen()),
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

// --- قسم المصحف المرتل (روابط حقيقية) ---
class AudioQuran extends StatelessWidget {
  const AudioQuran({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المصحف المرتل')),
      body: ListView(
        children: [
          _audioTile(context, 'سورة الفاتحة', 'المنشاوي', 'https://server10.mp3quran.net/minsh/001.mp3'),
          _audioTile(context, 'سورة البقرة', 'الحصري', 'https://server13.mp3quran.net/husr/002.mp3'),
          _audioTile(context, 'سورة الكهف', 'المنشاوي', 'https://server10.mp3quran.net/minsh/018.mp3'),
        ],
      ),
    );
  }

  Widget _audioTile(context, title, reader, url) => ListTile(
    leading: const Icon(Icons.play_circle_fill, color: Colors.tealAccent, size: 40),
    title: Text(title),
    subtitle: Text('بصوت الشيخ $reader'),
    onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('جاري تشغيل $title من الرابط: $url'))),
  );
}

// الأقسام المتبقية (تظل كما هي لضمان عمل التطبيق)
class SearchScreen extends StatelessWidget { const SearchScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('البحث')), body: const Center(child: Text('ابحث هنا...'))); }
class TafseerList extends StatelessWidget { const TafseerList({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('التفسير')), body: const Center(child: Text('تفسير القرآن الكريم'))); }
class AthkarList extends StatelessWidget { const AthkarList({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('الأذكار')), body: const Center(child: Text('قائمة الأذكار'))); }
class QiblaScreen extends StatelessWidget { const QiblaScreen({super.key}); @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('القبلة')), body: const Center(child: Icon(Icons.explore, size: 100))); }
class CounterScreen extends StatefulWidget { const CounterScreen({super.key}); @override State<CounterScreen> createState() => _CS(); }
class _CS extends State<CounterScreen> { int n = 0; @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('المسبحة')), body: Center(child: Text('$n', style: const TextStyle(fontSize: 100)))); }
