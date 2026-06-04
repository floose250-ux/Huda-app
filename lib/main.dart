import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));

class HudaProHome extends StatelessWidget {
  const HudaProHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(title: const Text('هدى برو - الموسوعة الشاملة'), backgroundColor: Colors.teal.shade900, centerTitle: true),
      body: GridView.count(
        crossAxisCount: 2, padding: const EdgeInsets.all(15), mainAxisSpacing: 15, crossAxisSpacing: 15,
        children: const [
          MainCategoryCard(t: 'المصحف الشريف', i: Icons.menu_book, c: Colors.amber),
          MainCategoryCard(t: 'موسوعة الأذكار', i: Icons.auto_awesome, c: Colors.orange, page: AzkarCategoriesPage()),
          MainCategoryCard(t: 'جوامع الدعاء', i: Icons.favorite, c: Colors.redAccent),
          MainCategoryCard(t: 'الموسوعة الحديثية', i: Icons.history_edu, c: Colors.blueAccent),
        ],
      ),
    );
  }
}

// Refactored helper method into a const StatelessWidget to optimize rebuild performance.
class MainCategoryCard extends StatelessWidget {
  final String t;
  final IconData i;
  final Color c;
  final Widget? page;

  const MainCategoryCard({super.key, required this.t, required this.i, required this.c, this.page});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF001F1F),
      // Using Radius.elliptical to ensure constant expressions for borders.
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(20, 20))),
      child: InkWell(
        onTap: () => page != null ? Navigator.push(context, MaterialPageRoute(builder: (context) => page!)) : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(i, size: 45, color: c),
            const SizedBox(height: 10),
            Text(t, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// صفحة تصنيفات الأذكار (الصباح، المساء، السفر، إلخ)
class AzkarCategoriesPage extends StatelessWidget {
  const AzkarCategoriesPage({super.key});

  // Moved static data out of build method to avoid redundant allocations on every rebuild.
  static const List<Map<String, dynamic>> categories = [
    {'title': 'أذكار الصباح', 'icon': Icons.wb_sunny, 'color': Colors.orange},
    {'title': 'أذكار المساء', 'icon': Icons.nightlight_round, 'color': Colors.blueGrey},
    {'title': 'أدعية الأنبياء', 'icon': Icons.person, 'color': Colors.green},
    {'title': 'أدعية من القرآن', 'icon': Icons.menu_book, 'color': Colors.amber},
    {'title': 'أدعية الاستسقاء', 'icon': Icons.water_drop, 'color': Colors.blue},
    {'title': 'أدعية السفر', 'icon': Icons.flight, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              // هنا ننتقل لصفحة المحتوى الضخم لكل تصنيف
            },
          ),
        ),
      ),
    );
  }
}
