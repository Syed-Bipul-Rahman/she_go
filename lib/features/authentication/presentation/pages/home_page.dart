import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodels/home_veiwmodel.dart';
import '../views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure all dependencies are resolved
    if (!Get.isRegistered<HomeViewModel>()) {
      Get.find<HomeViewModel>(); // Trigger lazy instantiation
    }
    return const HomeView();
  }
}
