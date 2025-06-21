import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/config/routes/app_router.dart';
import 'package:shego/config/routes/route_names.dart';
import 'package:shego/shared/theme/app_colors.dart';

import '../../../../core/utils/app_image.dart';
import '../../../../core/utils/log_helper.dart';
import '../../../../shared/widgets/buttons/primary_buttons.dart';
import '../viewmodels/local_data.controller.dart';

class JoinAs extends StatefulWidget {
  const JoinAs({super.key});

  @override
  State<JoinAs> createState() => _JoinAsState();
}

class _JoinAsState extends State<JoinAs> {
  final LocalDataController _localDataController = Get.put(
    LocalDataController(),
  );

  @override
  void initState() {
    super.initState();
    _localDataController.selectedOption =
        _localDataController.joinOptions[0]["header"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Join As",
              style: GoogleFonts.outfit(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1B1B1B),
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "Please select an one option to start\nYour journey",
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF494949),
              ),
            ),
            SizedBox(height: 16),
            // Selectable options
            ..._localDataController.joinOptions.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4,
                ),
                child: _buildSelectableOption(option),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PrimaryButton(
                radius: 4,
                onPressed: () {
                  Get.offAllNamed(RouteNames.login);
                },
                text: "Continue",
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableOption(Map<String, String> option) {
    bool isSelected = _localDataController.selectedOption == option["header"];

    return GestureDetector(
      onTap: () {
        setState(() {
          _localDataController.selectedOption = option["header"];
          LoggerHelper.info(_localDataController.selectedOption);
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color:
              isSelected
                  ? const Color(0xFFF5EFF9).withOpacity(0.30)
                  : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(option['icon']!, height: 48, width: 48),
                SizedBox(width: 8),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option["header"]!,
                      style: TextStyle(
                        color: Color(0xFF252525),
                        fontSize: 18,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(option["description"]!),
                  ],
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                // Handle toggle here
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  border: Border.all(color: AppColors.primary, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child:
                    isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
