import 'package:logging/logging.dart';
import '../entities/home_entity.dart';
import '../repositories/repository.dart';

class HomeUseCase {
  final HomeRepository repository;
  final Logger _logger = Logger('HomeUseCase');

  HomeUseCase({required this.repository});

  Future<List<HomeEntity>> execute(int page) async {
    try {
      final data = await repository.getData(page);
      _logger.info('Use case executed for page $page');
      return data;
    } catch (e) {
      _logger.severe('Error in use case: $e');
      rethrow;
    }
  }
}