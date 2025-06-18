import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class PaginationProvider extends ChangeNotifier {
  final Logger _logger = Logger('PaginationProvider');
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  int get currentPage => _currentPage;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  void setLoading(bool value) {
    _isLoading = value;
    _logger.info('Loading state changed to: $value');
    notifyListeners();
  }

  void incrementPage() {
    _currentPage++;
    _logger.info('Page incremented to: $_currentPage');
    notifyListeners();
  }

  void setHasMore(bool value) {
    _hasMore = value;
    _logger.info('Has more data: $value');
    notifyListeners();
  }
}