import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCacheManager {
  static final CustomCacheManager _instance = CustomCacheManager._internal();
  final DefaultCacheManager _cacheManager = DefaultCacheManager();

  factory CustomCacheManager() => _instance;

  CustomCacheManager._internal();

  Future<String> getFile(String url) async {
    final file = await _cacheManager.getSingleFile(url);
    return await file.readAsString();
  }
}
