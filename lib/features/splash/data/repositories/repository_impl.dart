import 'package:logging/logging.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/home_model.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;
  final Logger _logger = Logger('HomeRepositoryImpl');

  HomeRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<HomeEntity>> getData(int page) async {
    try {
      final data = await remoteDataSource.fetchData('https://api.example.com?page=$page');
      await localDataSource.cacheData('home_data_$page', data);
      _logger.info('Data fetched and cached for page $page');
      // Convert HomeModel to HomeEntity directly
      final model = HomeModel(id: '1', title: 'Sample', description: 'Sample Desc');
      return [HomeEntity(id: model.id, title: model.title, description: model.description)];
    } catch (e) {
      _logger.severe('Error fetching data: $e');
      final cachedData = await localDataSource.getCachedData('home_data_$page');
      if (cachedData != null) {
        _logger.info('Returning cached data for page $page');
        final model = HomeModel(id: '1', title: 'Cached', description: 'Cached Desc');
        return [HomeEntity(id: model.id, title: model.title, description: model.description)];
      }
      rethrow;
    }
  }
}