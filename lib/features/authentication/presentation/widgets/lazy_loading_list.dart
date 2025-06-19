import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/home_entity.dart';
import '../../data/providers/pagination_provider.dart';
import 'home_card.dart';

class LazyLoadingList extends StatelessWidget {
  final List<HomeEntity> items;
  final bool isLoading;
  final VoidCallback onLoadMore;

  const LazyLoadingList({
    super.key,
    required this.items,
    required this.isLoading,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    final paginationProvider = Get.find<PaginationProvider>();

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !isLoading &&
            paginationProvider.hasMore) {
          onLoadMore();
        }
        return false;
      },
      child: ListView.builder(
        itemCount: items.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == items.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return HomeCard(item: items[index]);
        },
      ),
    );
  }
}