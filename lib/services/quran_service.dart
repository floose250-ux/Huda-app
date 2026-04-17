import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class QuranService {
  static final QuranService _instance = QuranService._internal();
  factory QuranService() => _instance;
  QuranService._internal();

  List<dynamic>? _surahs;

  Future<List<dynamic>> getSurahs() async {
    if (_surahs != null) return _surahs!;

    final String response = await rootBundle.loadString('assets/quran.json');
    _surahs = await compute(_parseQuranData, response);

    return _surahs!;
  }

  static List<dynamic> _parseQuranData(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return data['surahs'] as List<dynamic>;
  }
}
