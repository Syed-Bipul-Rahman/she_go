import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/config/routes/route_names.dart';
import 'package:shego/core/utils/app_image.dart';
import 'package:shego/shared/theme/app_colors.dart';
import 'package:shego/shared/widgets/buttons/primary_buttons.dart';
import 'package:shego/shared/widgets/update_textFields.dart';

import '../../../../shared/widgets/pin_code_text_field.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verify Email",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),

                    Container(
                      height: 8,
                      width: 56,
                      decoration: BoxDecoration(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Please check your email and enter the code",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomPinCodeTextField(),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive code?",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              PrimaryButton(
                onPressed: () {},
                text: "Verify Email",
                width: Get.width,
                radius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
