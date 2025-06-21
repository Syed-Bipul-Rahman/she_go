import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/core/utils/app_image.dart';
import 'package:shego/shared/theme/app_colors.dart';
import '../viewmodels/home_veiwmodel.dart';
import '../widgets/lazy_loading_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = Get.find();
    final vahicles = ['Car', 'Luxury car', 'Suv', 'Schedule'];

    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      // body: Obx(
      //   () => LazyLoadingList(
      //     items: viewModel.items,
      //     isLoading: viewModel.isLoading.value,
      //     onLoadMore: viewModel.fetchData,
      //   ),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 24,
                      color: Colors.black.withAlpha(70),
                    ),
                    Text(
                      "3891 Ranchview Dr. Richardson, California 62639",
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1F1F1F),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                Text(
                  "Service",
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 24),

                SizedBox(
                  height: 90,
                  child: Row(
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.shimmerBase,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppImages.carImage),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              vahicles[index],
                              style: GoogleFonts.outfit(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
