import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HudaProHome(), debugShowCheckedModeBanner: false));

class HudaProHome extends StatelessWidget {
  const HudaProHome({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000D0D),
      appBar: _HomeAppBar(),
      body: _HomeGrid(),
    );
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('هدى برو - الموسوعة الشاملة'),
      backgroundColor: const Color(0xFF004D40),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeGrid extends StatelessWidget {
  const _HomeGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}

class MainCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget? page;

  const MainCategoryCard({
    required this.title,
    required this.icon,
    required this.color,
    this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF001F1F),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
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
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// صفحة تصنيفات الأذكار (الصباح، المساء، السفر، إلخ)
class AzkarCategoriesPage extends StatelessWidget {
  const AzkarCategoriesPage({super.key});

  static const List<Map<String, dynamic>> _categories = [
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
      appBar: const _AzkarAppBar(),
      body: ListView.builder(
        itemCount: _categories.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) => _AzkarCategoryCard(
          category: _categories[index],
        ),
      ),
    );
  }
}

class _AzkarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AzkarAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('موسوعة الأذكار'),
      backgroundColor: const Color(0xFF004D40),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AzkarCategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  const _AzkarCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF001F1F),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(category['icon'], color: category['color']),
        title: Text(
          category['title'],
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
