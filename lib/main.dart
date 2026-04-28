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
        // Performance: Using 'const' here ensures these widgets are only created once
        // and reused across rebuilds, reducing memory allocations.
        children: const [
          MainCategoryCard(
            title: 'المصحف الشريف',
            icon: Icons.menu_book,
            color: Colors.amber,
          ),
          MainCategoryCard(
            title: 'موسوعة الأذكار',
            icon: Icons.auto_awesome,
            color: Colors.orange,
            destinationPage: AzkarCategoriesPage(),
          ),
          MainCategoryCard(
            title: 'جوامع الدعاء',
            icon: Icons.favorite,
            color: Colors.redAccent,
          ),
          MainCategoryCard(
            title: 'الموسوعة الحديثية',
            icon: Icons.history_edu,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

/// A card widget for the main categories.
///
/// Performance: Refactored from a helper method into a [StatelessWidget] to
/// enable Flutter's rebuild optimizations.
class MainCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget? destinationPage;

  const MainCategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF001F1F),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => destinationPage != null
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destinationPage!),
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

  // Performance: Moving static data out of the build method to a static const
  // avoids redundant allocations on every widget build.
  static const List<Map<String, dynamic>> _categories = [
    {'title': 'أذكار الصباح', 'icon': Icons.wb_sunny, 'color': Colors.orange},
    {
      'title': 'أذكار المساء',
      'icon': Icons.nightlight_round,
      'color': Colors.blueGrey
    },
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
          backgroundColor: Colors.teal.shade900),
      body: ListView.builder(
        itemCount: _categories.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => Card(
          color: const Color(0xFF001F1F),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(_categories[index]['icon'] as IconData,
                color: _categories[index]['color'] as Color),
            title: Text(_categories[index]['title'] as String,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
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
