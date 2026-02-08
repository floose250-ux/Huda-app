import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});
  @override _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List surahs = [];

  // دالة قراءة البيانات من ملف الـ JSON
  Future<void> loadQuran() async {
    final String response = await rootBundle.loadString('assets/quran.json');
    final data = await json.decode(response);
    setState(() {
      surahs = data['surahs'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadQuran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('المصحف الشريف'), backgroundColor: const Color(0xFF001F1F)),
      body: surahs.isEmpty 
        ? const Center(child: CircularProgressIndicator()) // دائرة تحميل لحين قراءة الملف
        : ListView.builder(
            itemCount: surahs.length,
            itemBuilder: (context, i) => ListTile(
              leading: CircleAvatar(backgroundColor: Colors.teal.shade900, child: Text('${surahs[i]['id']}', style: const TextStyle(color: Colors.amber, fontSize: 12))),
              title: Text(surahs[i]['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white24),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => SuraDetail(sura: surahs[i]))),
            ),
          ),
    );
  }
}

class SuraDetail extends StatelessWidget {
  final Map sura;
  const SuraDetail({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    List verses = sura['verses'];
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), // لون ورق المصحف المريح
      appBar: AppBar(title: Text('سورة ${sura['name']}'), backgroundColor: Colors.teal.shade900),
      body: ListView.builder(
        itemCount: verses.length,
        itemBuilder: (context, i) => _buildVerse(context, verses[i]),
      ),
    );
  }

  Widget _buildVerse(BuildContext c, Map v) {
    return InkWell(
      onTap: () => showModalBottomSheet(context: c, backgroundColor: const Color(0xFF001F1F), builder: (c) => DefaultTabController(
        length: 2,
        child: Column(children: [
          const TabBar(tabs: [Tab(text: 'التفسير'), Tab(text: 'الإعراب')], indicatorColor: Colors.amber, labelColor: Colors.amber),
          Expanded(child: TabBarView(children: [
            SingleChildScrollView(padding: const EdgeInsets.all(20), child: Text(v['tafsir'] ?? 'جاري العمل على إضافة التفسير لهذه الآية...', textAlign: TextAlign.right, style: const TextStyle(color: Colors.white, fontSize: 18))),
            SingleChildScrollView(padding: const EdgeInsets.all(20), child: Text(v['irab'] ?? 'جاري العمل على إضافة الإعراب لهذه الآية...', textAlign: TextAlign.right, style: const TextStyle(color: Colors.white, fontSize: 18))),
          ]))
        ]),
      )),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Text("${v['text']} (${v['id']})", textAlign: TextAlign.center, style: const TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold, height: 1.8)),
      ),
    );
  }
}
