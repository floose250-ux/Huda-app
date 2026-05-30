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
        crossAxisCount: 2,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: const [
          MainCategoryCard(title: 'المصحف الشريف', icon: Icons.menu_book, color: Colors.amber),
          MainCategoryCard(title: 'موسوعة الأذكار', icon: Icons.auto_awesome, color: Colors.orange, page: AzkarCategoriesPage()),
          MainCategoryCard(title: 'جوامع الدعاء', icon: Icons.favorite, color: Colors.redAccent),
          MainCategoryCard(title: 'الموسوعة الحديثية', icon: Icons.history_edu, color: Colors.blueAccent),
        ],
      ),
    );
  }
}

/// Refactored from a helper method to a const widget class to enable
/// framework-level rebuild optimizations and improve performance.
class MainCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget? page;

  const MainCategoryCard({
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => page != null
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page!),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة تصنيفات الأذكار (الصباح، المساء، السفر، إلخ)
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
            leading: Icon(categories[index]['icon'], color: categories[index]['color']),
            title: Text(categories[index]['title'], style: const TextStyle(color: Colors.white, fontSize: 18)),
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
