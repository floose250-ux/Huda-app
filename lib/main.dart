import 'package:flutter/material.dart';

void main() {
  runApp(const HudaApp());
}

class HudaApp extends StatelessWidget {
  const HudaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'هدى | Huda',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('هدى | Huda')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('📖 القرآن الكريم'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('🕌 الأذكار'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AthkarScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class AthkarScreen extends StatelessWidget {
  const AthkarScreen({super.key});

  final List<Map<String, String>> athkar = const [
    {'title': 'أذكار الصباح', 'content': 'أصبحنا وأصبح الملك لله والحمد لله...'},
    {'title': 'أذكار المساء', 'content': 'أمسينا وأمسى الملك لله والحمد لله...'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحة الأذكار')),
      body: ListView.builder(
        itemCount: athkar.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(athkar[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(athkar[index]['content']!),
            ),
          );
        },
      ),
    );
  }
}
