import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));

class HudaProHome extends StatelessWidget {
  const HudaProHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(
        title: const Text('هدى برو - الموسوعة الشاملة'),
        backgroundColor: const Color(0xFF004D40),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(15),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: const [
          MainCategoryCard(
            title: 'المصحف الشريف',
            icon: Icons.menu_book,
            color: Color(0xFFFFC107),
          ),
          MainCategoryCard(
            title: 'موسوعة الأذكار',
            icon: Icons.auto_awesome,
            color: Color(0xFFFF9800),
            page: AzkarCategoriesPage(),
          ),
          MainCategoryCard(
            title: 'جوامع الدعاء',
            icon: Icons.favorite,
            color: Color(0xFFFF5252),
          ),
          MainCategoryCard(
            title: 'الموسوعة الحديثية',
            icon: Icons.history_edu,
            color: Color(0xFF448AFF),
          ),
        ],
      ),
    );
  }
}

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: InkWell(
        onTap: () {
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page!),
            );
          }
        },
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

  // نقل البيانات إلى حقل ثابت لتقليل عمليات التخصيص المتكررة في كل بناء
  static const List<Map<String, dynamic>> _categories = [
    {
      'title': 'أذكار الصباح',
      'icon': Icons.wb_sunny,
      'color': Color(0xFFFF9800),
    },
    {
      'title': 'أذكار المساء',
      'icon': Icons.nightlight_round,
      'color': Color(0xFF607D8B),
    },
    {
      'title': 'أدعية الأنبياء',
      'icon': Icons.person,
      'color': Color(0xFF4CAF50),
    },
    {
      'title': 'أدعية من القرآن',
      'icon': Icons.menu_book,
      'color': Color(0xFFFFC107),
    },
    {
      'title': 'أدعية الاستسقاء',
      'icon': Icons.water_drop,
      'color': Color(0xFF2196F3),
    },
    {
      'title': 'أدعية السفر',
      'icon': Icons.flight,
      'color': Color(0xFF9C27B0),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(
        title: const Text('موسوعة الأذكار'),
        backgroundColor: const Color(0xFF004D40),
      ),
      body: ListView.builder(
        itemCount: _categories.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Card(
            color: const Color(0xFF001F1F),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                category['icon'] as IconData,
                color: category['color'] as Color,
              ),
              title: Text(
                category['title'] as String,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24),
              onTap: () {
                // هنا ننتقل لصفحة المحتوى الضخم لكل تصنيف
              },
            ),
          );
        },
      ),
    );
  }
}
