import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

// Singleton service to manage Quran data with caching and pre-loading
class QuranService {
  static final QuranService _instance = QuranService._internal();
  factory QuranService() => _instance;
  QuranService._internal();

  List<dynamic>? _surahs;
  bool _isLoading = false;

  List<dynamic>? get surahs => _surahs;
  bool get isLoading => _isLoading;

  // Pre-load data to ensure it's available when needed
  // Uses compute() to offload JSON decoding to a background isolate for better performance
  Future<void> loadData() async {
    if (_surahs != null || _isLoading) return;
    _isLoading = true;
    try {
      final String res = await rootBundle.loadString('assets/quran.json');
      final data = await compute(json.decode, res) as Map<String, dynamic>;
      _surahs = data['surahs'];
    } catch (e) {
      debugPrint('Error loading Quran data: \$e');
    } finally {
      _isLoading = false;
    }
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Start pre-loading Quran data immediately
  QuranService().loadData();
  runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));
}

class HudaProHome extends StatelessWidget {
  const HudaProHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(
        title: const Text('هدى برو - الموسوعة الشاملة'),
        backgroundColor: Colors.teal.shade900,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: const [
          MainCard(title: 'المصحف الشريف', icon: Icons.menu_book, color: Colors.amber, page: QuranPage()),
          MainCard(title: 'موسوعة الأذكار', icon: Icons.auto_awesome, color: Colors.orange, page: AzkarCategoriesPage()),
          MainCard(title: 'جوامع الدعاء', icon: Icons.favorite, color: Colors.redAccent, page: null),
          MainCard(title: 'الموسوعة الحديثية', icon: Icons.history_edu, color: Colors.blueAccent, page: null),
        ],
      ),
    );
  }
}

// Extracted MainCard to a const widget to optimize rebuilds
class MainCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget? page;

  const MainCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF001F1F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          if (page != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class AzkarCategoriesPage extends StatelessWidget {
  const AzkarCategoriesPage({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'أذكار الصباح', 'icon': Icons.wb_sunny, 'color': Colors.orange},
      {'title': 'أذكار المساء', 'icon': Icons.nightlight_round, 'color': Colors.blueGrey},
      {'title': 'أدعية الأنبياء', 'icon': Icons.person, 'color': Colors.green},
      {'title': 'أدعية من القرآن', 'icon': Icons.menu_book, 'color': Colors.amber},
      {'title': 'أدعية الاستسقاء', 'icon': Icons.water_drop, 'color': Colors.blue},
      {'title': 'أدعية السفر', 'icon': Icons.flight, 'color': Colors.purple},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('موسوعة الأذكار'), backgroundColor: Colors.teal.shade900),
      body: ListView.builder(
        itemCount: categories.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => Card(
          color: const Color(0xFF001F1F),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(categories[index]['icon'] as IconData, color: categories[index]['color'] as Color),
            title: Text(categories[index]['title'] as String, style: const TextStyle(color: Colors.white, fontSize: 18)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});
  @override _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final _service = QuranService();

  @override
  void initState() {
    super.initState();
    if (_service.surahs == null) {
      _service.loadData().then((_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final surahs = _service.surahs;
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('المصحف الشريف'), backgroundColor: const Color(0xFF001F1F)),
      body: surahs == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: surahs.length,
            itemBuilder: (c, i) => ListTile(
              leading: CircleAvatar(child: Text('${surahs[i]['id']}')),
              title: Text(surahs[i]['name'], style: const TextStyle(color: Colors.white)),
            ),
          ),
    );
  }
}
