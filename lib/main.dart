import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));

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
        // Bolt Optimization: Using const here allows Flutter to cache the entire widget tree
        // and avoid rebuilding it if nothing has changed.
        children: const [
          MainCard(title: 'المصحف الشريف', icon: Icons.menu_book, color: Colors.amber),
          MainCard(
            title: 'موسوعة الأذكار',
            icon: Icons.auto_awesome,
            color: Colors.orange,
            page: AzkarCategoriesPage(),
          ),
          MainCard(title: 'جوامع الدعاء', icon: Icons.favorite, color: Colors.redAccent),
          MainCard(title: 'الموسوعة الحديثية', icon: Icons.history_edu, color: Colors.blueAccent),
        ],
      ),
    );
  }
}

// Bolt Optimization: Refactored helper method into a StatelessWidget.
// This enables Flutter's rebuild optimizations as it can now independently manage
// this widget's lifecycle and skip builds if parameters haven't changed.
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
        onTap: () => page != null
            ? Navigator.push(context, MaterialPageRoute(builder: (context) => page!))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  // Bolt Optimization: Moved static data to a static const member.
  // This prevents redundant allocations of this list on every build call.
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
      appBar: AppBar(
        title: const Text('موسوعة الأذكار'),
        backgroundColor: Colors.teal.shade900,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => CategoryCard(index: index),
      ),
    );
  }
}

// Bolt Optimization: Extracted list item into a separate StatelessWidget.
// This localizes rebuilds and allows the builder to handle items more efficiently.
class CategoryCard extends StatelessWidget {
  final int index;
  const CategoryCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF001F1F),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          AzkarCategoriesPage.categories[index]['icon'] as IconData,
          color: AzkarCategoriesPage.categories[index]['color'] as Color,
        ),
        title: Text(
          AzkarCategoriesPage.categories[index]['title'] as String,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24),
        onTap: () {
          // هنا ننتقل لصفحة المحتوى الضخم لكل تصنيف
        },
      ),
    );
  }
}
