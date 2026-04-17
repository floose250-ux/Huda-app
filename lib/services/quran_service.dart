import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Service to handle Quran data loading and caching.
/// Uses the singleton pattern for global access and 'compute' for background parsing.
class QuranService {
  static final QuranService _instance = QuranService._internal();

  factory QuranService() => _instance;

  QuranService._internal();

  Map<String, dynamic>? _quranData;

  /// Returns the cached Quran data.
  Map<String, dynamic>? get quranData => _quranData;

  /// Initializes the service by loading and parsing the Quran JSON asset.
  /// Parsing is offloaded to a background isolate using 'compute'.
  Future<void> init() async {
    if (_quranData != null) return;

    try {
      final String jsonString = await rootBundle.loadString('assets/quran.json');
      // Performance: Offload JSON parsing to a background isolate to keep UI responsive.
      _quranData = await compute(_parseQuranJson, jsonString);
    } catch (e) {
      debugPrint('Bolt: Error loading Quran data: $e');
    }
  }

  static Map<String, dynamic> _parseQuranJson(String jsonString) {
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
