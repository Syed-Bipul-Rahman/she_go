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
                SizedBox(height: 16),

                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: AppColors.shimmerBase),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          size: 24,
                          color: AppColors.shimmerBase,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Banashree rampura Dhaka 1120",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.shimmerBase,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          size: 24,
                          color: AppColors.shimmerBase,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primaryLight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.string(
                                """<svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="20" cy="20" r="20" fill="white"/>
<path d="M17.7778 28.8889V22.2222H22.2222V28.8889H27.7778V20H31.1111L20 10L8.88889 20H12.2222V28.8889H17.7778Z" fill="#1F1F1F"/>
</svg>""",
                              ),

                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Home",
                                    style: GoogleFonts.outfit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    "Set home address",
                                    style: GoogleFonts.outfit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.shimmerBase,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 2,
                          color: AppColors.shimmerBase,
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.string(
                                  """<svg width="37" height="36" viewBox="0 0 37 36" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="18.4443" cy="18" r="18" fill="white"/>
<path d="M26.4443 12H22.4443V10C22.4443 8.89 21.5543 8 20.4443 8H16.4443C15.3343 8 14.4443 8.89 14.4443 10V12H10.4443C9.33434 12 8.45434 12.89 8.45434 14L8.44434 25C8.44434 26.11 9.33434 27 10.4443 27H26.4443C27.5543 27 28.4443 26.11 28.4443 25V14C28.4443 12.89 27.5543 12 26.4443 12ZM20.4443 12H16.4443V10H20.4443V12Z" fill="#1F1F1F"/>
</svg>
""",
                                ),

                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Office",
                                      style: GoogleFonts.outfit(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      "Set Office address",
                                      style: GoogleFonts.outfit(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.shimmerBase,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                Container(
                  height: 97,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppColors.shimmerBase),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.string("""
                      <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M11 22C17.0751 22 22 17.0751 22 11C22 4.92487 17.0751 0 11 0C4.92487 0 0 4.92487 0 11C0 17.0751 4.92487 22 11 22ZM9 4H12V10H17V13H9V4Z" fill="#F564A9"/>
</svg>
"""),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 247,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dhaka National park",
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "Set Office address",
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.shimmerBase,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Center(child: Icon(Icons.arrow_forward_ios, size: 16)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 97,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppColors.shimmerBase),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.string("""
                      <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M11 22C17.0751 22 22 17.0751 22 11C22 4.92487 17.0751 0 11 0C4.92487 0 0 4.92487 0 11C0 17.0751 4.92487 22 11 22ZM9 4H12V10H17V13H9V4Z" fill="#F564A9"/>
</svg>
"""),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 247,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dhaka National park",
                                style: GoogleFonts.outfit(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                "Set Office address",
                                style: GoogleFonts.outfit(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.shimmerBase,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Center(child: Icon(Icons.arrow_forward_ios, size: 16)),
                      ],
                    ),
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
