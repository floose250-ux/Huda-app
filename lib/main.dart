import 'package:flutter/material.dart';

void main() => runApp(const HudaApp());

class HudaApp extends StatelessWidget {
  const HudaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تطبيق هدى الشامل')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _card(context, 'القرآن الكريم (كامل السور)', Icons.book, const QuranList()),
          _card(context, 'التفسير وعلوم القرآن', Icons.library_books, const TafseerList()),
          _card(context, 'حصن المسلم (أذكار ضخمة)', Icons.Wb_sunny, const AthkarList()),
          _card(context, 'الأحاديث النبوية الشريفة', Icons.auto_stories, const HadithList()),
          _card(context, 'المسبحة الإلكترونية', Icons.fingerprint, const CounterScreen()),
        ],
      ),
    );
  }

  Widget _card(BuildContext context, String t, IconData i, Widget s) => Card(
    child: ListTile(
      leading: Icon(i, color: Colors.greenAccent, size: 30),
      title: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => s)),
    ),
  );
}

// --- قسم القرآن الكريم ---
class QuranList extends StatelessWidget {
  const QuranList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فهرس السور')),
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) => ListTile(
          title: Text('سورة رقم ${index + 1}'),
          onTap: () => _showText(context, 'السورة رقم ${index + 1}', 'هنا يوضع نص السورة كاملاً...'),
        ),
      ),
    );
  }
}

// --- قسم الأذكار الضخم ---
class AthkarList extends StatelessWidget {
  const AthkarList({super.key});
  final Map<String, List<String>> data = const {
    'أذكار الصباح': ['أصبحنا وأصبح الملك لله', 'آية الكرسي', 'سورة الإخلاص (3 مرات)'],
    'أذكار المساء': ['أمسينا وأمسى الملك لله', 'اللهم بك أمسينا', 'أعوذ بكلمات الله التامات'],
    'أذكار النوم': ['باسمك ربي وضعت جنبي', 'سورة الملك'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أذكار حصن المسلم')),
      body: ListView(
        children: data.keys.map((k) => ListTile(
          title: Text(k),
          onTap: () => _showText(context, k, data[k]!.join('\n\n')),
        )).toList(),
      ),
    );
  }
}

// --- قسم الأحاديث ---
class HadithList extends StatelessWidget {
  const HadithList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأربعون النووية')),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (c, i) => ListTile(title: Text('الحديث رقم ${i+1}')),
      ),
    );
  }
}

// --- شاشة عرض النصوص الموحدة ---
void _showText(BuildContext context, String title, String content) {
  Navigator.push(context, MaterialPageRoute(builder: (c) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Text(content, style: const TextStyle(fontSize: 20), textAlign: TextAlign.right),
    ),
  )));
}

// --- المسبحة ---
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CS();
}
class _CS extends State<CounterScreen> {
  int n = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('المسبحة')),
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('$n', style: const TextStyle(fontSize: 100)),
      IconButton(iconSize: 80, icon: const Icon(Icons.add_circle, color: Colors.green), onPressed: () => setState(() => n++))
    ])),
  );
}

// --- قسم التفسير ---
class TafseerList extends StatelessWidget {
  const TafseerList({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('التفسير الميسر')), body: const Center(child: Text('قائمة التفسير لكل كلمة')));
}
