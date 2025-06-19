import 'package:get/get.dart';
import 'package:logging/logging.dart';
import '../../domain/usecases/home_usecase.dart';
import '../../data/providers/pagination_provider.dart';
import '../../domain/entities/home_entity.dart';

class HomeViewModel extends GetxController {
  final HomeUseCase useCase;
  final PaginationProvider paginationProvider;
  final Logger _logger = Logger('HomeViewModel');

  final RxList<HomeEntity> items = <HomeEntity>[].obs;
  final RxBool isLoading = false.obs;

  HomeViewModel({required this.useCase, required this.paginationProvider});

  Future<void> fetchData() async {
    if (paginationProvider.isLoading || !paginationProvider.hasMore) return;

    try {
      paginationProvider.setLoading(true);
      final data = await useCase.execute(paginationProvider.currentPage);
      items.addAll(data);
      paginationProvider.incrementPage();
      _logger.info('Data fetched for page ${paginationProvider.currentPage}');
    } catch (e) {
      _logger.severe('Error fetching data: $e');
      paginationProvider.setHasMore(false);
    } finally {
      paginationProvider.setLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}