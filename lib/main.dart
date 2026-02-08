import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));

class HudaProHome extends StatelessWidget {
  const HudaProHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('هدى برو - المصحف المطور'), backgroundColor: Colors.teal.shade900, centerTitle: true),
      body: GridView.count(
        crossAxisCount: 2, padding: const EdgeInsets.all(15), mainAxisSpacing: 15, crossAxisSpacing: 15,
        children: [
          _mainCard(context, 'المصحف الشريف', Icons.menu_book, Colors.amber, const QuranSuraList()),
          _mainCard(context, 'أذكار المسلم', Icons.wb_sunny, Colors.orange, null),
          _mainCard(context, 'تحدي الاستغفار', Icons.fingerprint, Colors.tealAccent, null),
          _mainCard(context, 'الموسوعة الحديثية', Icons.History_edu, Colors.blueAccent, null),
        ],
      ),
    );
  }

  Widget _mainCard(BuildContext context, String t, IconData i, Color c, Widget? page) => Card(
    color: const Color(0xFF001F1F),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: InkWell(
      onTap: () => page != null ? Navigator.push(context, MaterialPageRoute(builder: (context) => page)) : null,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(i, size: 45, color: c), const SizedBox(height: 10), Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
    ),
  );
}

// صفحة قائمة السور (شكل محترم واحترافي)
class QuranSuraList extends StatelessWidget {
  const QuranSuraList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('فهرس السور'), backgroundColor: Colors.teal.shade900),
      body: ListView.separated(
        itemCount: 3, // مثال لأول 3 سور لضمان عمل الكود
        separatorBuilder: (context, index) => Divider(color: Colors.teal.withOpacity(0.2)),
        itemBuilder: (context, index) {
          List<String> suras = ['الفاتحة', 'البقرة', 'آل عمران'];
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.amber, child: Text('${index + 1}', style: const TextStyle(color: Colors.black))),
            title: Text(suras[index], style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SuraDetails(name: suras[index]))),
          );
        },
      ),
    );
  }
}

// صفحة عرض الآيات مع ميزة (تفسير، إعراب، معنى)
class SuraDetails extends StatelessWidget {
  final String name;
  const SuraDetails({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), // لون ورق المصحف القديم
      appBar: AppBar(title: Text('سورة $name'), backgroundColor: Colors.teal.shade900),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildVerse(context, "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ", "مبتدأ وخبر..", "باسم الله نبدأ..", "الله: اسم الجلالة.."),
          _buildVerse(context, "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ", "الْحَمْدُ: مبتدأ مرفوع..", "الثناء الكامل لله وحده..", "رَبِّ: نعت لله.."),
        ],
      ),
    );
  }

  Widget _buildVerse(BuildContext context, String text, String iarab, String tafsir, String meanings) {
    return InkWell(
      onTap: () => _showVerseDetails(context, text, iarab, tafsir, meanings),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
        child: Text(text, textAlign: TextAlign.right, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Traditional Arabic', color: Colors.black87)),
      ),
    );
  }

  // النافذة المنبثقة (مثل تطبيق وحي)
  void _showVerseDetails(BuildContext context, String v, String i, String t, String m) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF001F1F),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(tabs: [Tab(text: 'التفسير'), Tab(text: 'الإعراب'), Tab(text: 'المعاني')], indicatorColor: Colors.amber),
            Expanded(
              child: TabBarView(children: [
                _detailTab('تفسير الآية', t), _detailTab('إعراب الآية', i), _detailTab('معاني الكلمات', m),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailTab(String title, String content) => Padding(
    padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(child: Column(children: [
      Text(title, style: const TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      Text(content, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5)),
    ])),
  );
}
