import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/core/utils/app_image.dart';
import 'package:shego/shared/theme/app_colors.dart';
import 'package:shego/shared/widgets/update_textFields.dart';
import '../viewmodels/home_veiwmodel.dart';
import '../widgets/lazy_loading_list.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                      "Sign in to your account",
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
                  "Welcome! Sign in to your account to continue.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 24),

              // With full customization
              UpdateTextField(
                hintText: "Enter Password",
                prefixIconPath: AppImages.email,
                fillColor: AppColors.secondary,
                borderColor: AppColors.primary,
                focusedBorderColor: AppColors.primaryDark,
                borderRadius: 32,
                borderWidth: 1.0,
              ),
              SizedBox(height: 12),
              // With full customization
              UpdateTextField(
                hintText: "Enter Password",
                prefixIconPath: AppImages.lockIcon,
                fillColor: AppColors.secondary,
                borderColor: AppColors.primary,
                focusedBorderColor: AppColors.primaryDark,
                borderRadius: 32,
                borderWidth: 1.0,
                isPasswordField: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
