import 'package:flutter/material.dart';
import '../services/quran_service.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final QuranService _quranService = QuranService();
  List<dynamic>? _surahs;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSurahs();
  }

  Future<void> _loadSurahs() async {
    final surahs = await _quranService.getSurahs();
    if (mounted) {
      setState(() {
        _surahs = surahs;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000D0D),
      appBar: AppBar(
        title: const Text('المصحف الشريف'),
        backgroundColor: const Color(0xFF001F1F),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.teal))
          : ListView.separated(
              itemCount: _surahs?.length ?? 0,
              padding: const EdgeInsets.symmetric(vertical: 10),
              separatorBuilder: (context, index) => const Divider(color: Colors.white10),
              itemBuilder: (context, index) {
                final surah = _surahs![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.withOpacity(0.2),
                    child: Text(
                      '${surah['id']}',
                      style: const TextStyle(color: Colors.tealAccent, fontSize: 14),
                    ),
                  ),
                  title: Text(
                    surah['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
                  onTap: () {
                    // Navigate to Surah details
                  },
                );
              },
            ),
    );
  }
}
