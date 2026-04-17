import 'package:flutter_test/flutter_test.dart';
import 'package:huda_pro/services/quran_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('QuranService Tests', () {
    test('QuranService is a singleton', () {
      final s1 = QuranService();
      final s2 = QuranService();
      expect(identical(s1, s2), isTrue);
    });

    test('init() loads and parses quran.json', () async {
      // Note: We need to mock the rootBundle or have the asset available in the test environment.
      // In a real Flutter test environment, assets in pubspec.yaml are available.

      final service = QuranService();
      await service.init();

      expect(service.quranData, isNotNull);
      expect(service.quranData!['surahs'], isA<List>());
      expect(service.quranData!['surahs'].isNotEmpty, isTrue);
    });
  });
}
