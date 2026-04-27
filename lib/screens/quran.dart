import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // For compute

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});
  @override _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List surahs = [];
  bool isLoading = true;

  Future<void> loadData() async {
    try {
      final String res = await rootBundle.loadString('assets/quran.json');
      // Performance Optimization: Use compute() to parse JSON in a background isolate
      // This prevents the UI thread from blocking while parsing the 464KB JSON file.
      final data = await compute(_parseJson, res);
      if (mounted) {
        setState(() {
          surahs = data['surahs'];
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
      }
      debugPrint('Error loading Quran data: $e');
    }
  }

  // Static top-level function for compute
  static Map<String, dynamic> _parseJson(String jsonString) {
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFF000D0D),
    appBar: AppBar(
      title: const Text('المصحف الشريف'),
      backgroundColor: const Color(0xFF001F1F),
      centerTitle: true,
    ),
    body: isLoading
        ? const Center(child: CircularProgressIndicator(color: Colors.teal))
        : ListView.builder(
            itemCount: surahs.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (c, i) => Card(
              color: const Color(0xFF001F1F),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade900,
                  child: Text('${i + 1}', style: const TextStyle(color: Colors.white)),
                ),
                title: Text(
                  surahs[i]['name'],
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 18),
              ),
            ),
          ),
  );
}
