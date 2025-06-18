import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';

class HomeLocalDataSource {
  final SharedPreferences sharedPreferences;
  final Logger _logger = Logger('HomeLocalDataSource');

  HomeLocalDataSource({required this.sharedPreferences});

  Future<void> cacheData(String key, String data) async {
    try {
      await sharedPreferences.setString(key, data);
      _logger.info('Data cached for key: $key');
    } catch (e) {
      _logger.severe('Error caching data: $e');
      rethrow;
    }
  }

  Future<String?> getCachedData(String key) async {
    try {
      final data = sharedPreferences.getString(key);
      _logger.info('Retrieved cached data for key: $key');
      return data;
    } catch (e) {
      _logger.severe('Error retrieving cached data: $e');
      rethrow;
    }
  }
}