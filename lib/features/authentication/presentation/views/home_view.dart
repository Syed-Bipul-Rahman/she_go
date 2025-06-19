import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/home_veiwmodel.dart';
import '../widgets/lazy_loading_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Obx(
        () => LazyLoadingList(
          items: viewModel.items,
          isLoading: viewModel.isLoading.value,
          onLoadMore: viewModel.fetchData,
        ),
      ),
    );
  }
}
