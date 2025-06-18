import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../core/utils/cache_manager.dart';
import '../../core/utils/shared_preferences_util.dart';
import '../../features/home/data/datasources/local_data_source.dart';
import '../../features/home/data/datasources/remote_data_source.dart';
import '../../features/home/data/providers/pagination_provider.dart';
import '../../features/home/data/repositories/repository_impl.dart';
import '../../features/home/domain/repositories/repository.dart';
import '../../features/home/domain/usecases/home_usecase.dart';
import '../../features/home/presentation/viewmodels/home_veiwmodel.dart';
import '../routes/app_router.dart';

class Injector {
  static Future<void> init() async {
    // Initialize SharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.put<SharedPreferences>(sharedPreferences);

    // Utils
    final sharedPrefsUtil = SharedPreferencesUtil();
    await sharedPrefsUtil.init();
    Get.lazyPut(() => sharedPrefsUtil, fenix: true);
    Get.lazyPut<DefaultCacheManager>(() => DefaultCacheManager(), fenix: true);
    Get.lazyPut(() => CustomCacheManager(), fenix: true);

    // Data Sources
    Get.lazyPut(
      () => HomeLocalDataSource(sharedPreferences: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeRemoteDataSource(cacheManager: Get.find<DefaultCacheManager>()),
      fenix: true,
    );

    // Providers
    Get.lazyPut(() => PaginationProvider(), fenix: true);

    // Repositories
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(
        localDataSource: Get.find(),
        remoteDataSource: Get.find(),
      ),
      fenix: true,
    );

    // Use Cases
    Get.lazyPut(
      () => HomeUseCase(repository: Get.find<HomeRepository>()),
      fenix: true,
    );

    // ViewModels
    Get.lazyPut(
      () => HomeViewModel(useCase: Get.find(), paginationProvider: Get.find()),
      fenix: true,
    );

    // Router
    Get.lazyPut(() => AppRouter(), fenix: true);
  }
}
