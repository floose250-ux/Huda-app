import 'package:flutter/material.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});
  final List<String> surahs = const ['الفاتحة', 'البقرة', 'آل عمران', 'النساء', 'المائدة', 'الأنعام', 'الأعراف', 'الأنفال', 'التوبة', 'يونس', 'هود', 'يوسف', 'الرعد', 'إبراهيم', 'الحجر', 'النحل', 'الإسراء', 'الكهف', 'مريم', 'طه', 'الأنبياء', 'الحج', 'المؤمنون', 'النور', 'الفرقان', 'الشعراء', 'النمل', 'القصص', 'العنكبوت', 'الروم', 'لقمان', 'السجدة', 'الأحزاب', 'سبأ', 'فاطر', 'يس', 'الصافات', 'ص', 'الزمر', 'غافر', 'فصلت', 'الشورى', 'الزخرف', 'الدخان', 'الجاثية', 'الأحقاف', 'محمد', 'الفتح', 'الحجرات', 'ق', 'الذاريات', 'الطور', 'النجم', 'القمر', 'الرحمن', 'الواقعة', 'الحديد', 'المجادلة', 'الحشر', 'الممتحنة', 'الصف', 'الجمعة', 'المنافقون', 'التغابن', 'الطلاق', 'التحريم', 'الملك', 'القلم', 'الحاقة', 'المعارج', 'نوح', 'الجن', 'المزمل', 'المدثر', 'القيامة', 'الإنسان', 'المرسلات', 'النبأ', 'النازعات', 'عبس', 'التكوير', 'الانفطار', 'المطففين', 'الانشقاق', 'البروج', 'الطارق', 'الأعلى', 'الغاشية', 'الفجر', 'البلد', 'الشمس', 'الليل', 'الضحى', 'الشرح', 'التين', 'العلق', 'القدر', 'البينة', 'الزلزلة', 'العاديات', 'القارعة', 'التكاثر', 'العصر', 'الهمزة', 'الفيل', 'قريش', 'الماعون', 'الكوثر', 'الكافرون', 'النصر', 'المسد', 'الإخلاص', 'الفلق', 'الناس'];

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF000D0D),
    appBar: AppBar(title: const Text('المصحف الشريف'), backgroundColor: const Color(0xFF001F1F)),
    body: ListView.builder(
      itemCount: surahs.length,
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(child: Text('${i + 1}')),
        title: Text(surahs[i], style: const TextStyle(color: Colors.white)),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => VerseDetail(name: surahs[i]))),
      ),
    ),
  );
}

class VerseDetail extends StatelessWidget {
  final String name;
  const VerseDetail({super.key, required this.name});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFF5F5DC),
    appBar: AppBar(title: Text('سورة $name'), backgroundColor: Colors.teal.shade900),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      _item(context, "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ (1)", "تفسير: نبدأ مستعينين بالله..", "إعراب: الباء حرف جر.."),
      _item(context, "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ (2)", "تفسير: الثناء الكامل لله..", "إعراب: الحمدُ مبتدأ مرفوع.."),
    ]),
  );
  Widget _item(BuildContext c, String v, String t, String i) => InkWell(
    onTap: () => showModalBottomSheet(context: c, builder: (c) => DefaultTabController(length: 2, child: Column(children: [
      const TabBar(tabs: [Tab(text: 'التفسير'), Tab(text: 'الإعراب')], labelColor: Colors.teal),
      Expanded(child: TabBarView(children: [Center(child: Text(t)), Center(child: Text(i))]))
    ]))),
    child: Padding(padding: const EdgeInsets.all(15), child: Text(v, textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold))),
  );
}

