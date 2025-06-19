import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/shared/theme/app_colors.dart';

import '../../../../core/utils/app_image.dart';
import '../../../../core/utils/log_helper.dart';
import '../../../../shared/widgets/buttons/primary_buttons.dart';

class JoinAs extends StatefulWidget {
  const JoinAs({super.key});

  @override
  State<JoinAs> createState() => _JoinAsState();
}

class _JoinAsState extends State<JoinAs> {
  String? selectedOption;
  List<Map<String, String>> cycleOptions = [
    {
      "header": "User",
      "description": "Create your account User",
      "icon": AppImages.driverIcon,
    },
    {
      "header": "Driver",
      "description": "Create your account and\nBegin your journey",
      "icon": AppImages.userIcon,
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedOption = cycleOptions[0]["header"];
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
            ...cycleOptions.map(
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
                  if (selectedOption == "Business") {
                    //Get.toNamed(Approu.RESTAURANT_HOME_PAGE);
                  } else {
                    // Get.toNamed(Routes.LOGIN_PAGE);
                  }
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
    bool isSelected = selectedOption == option["header"];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option["header"];
          LoggerHelper.info(selectedOption);
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
            // Checkbox(value: isSelected, onChanged: (value) {}),
          ],
        ),
      ),
    );
  }
}
