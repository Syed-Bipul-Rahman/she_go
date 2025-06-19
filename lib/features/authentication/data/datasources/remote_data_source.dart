import 'package:logging/logging.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomeRemoteDataSource {
  final DefaultCacheManager cacheManager;
  final Logger _logger = Logger('HomeRemoteDataSource');

  HomeRemoteDataSource({required this.cacheManager});

  Future<String> fetchData(String url) async {
    try {
      final file = await cacheManager.getSingleFile(url);
      final data = await file.readAsString();
      _logger.info('Data fetched from $url');
      return data;
    } catch (e) {
      _logger.severe('Error fetching data: $e');
      rethrow;
    }
  }
}