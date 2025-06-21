import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/config/routes/route_names.dart';
import 'package:shego/core/utils/app_image.dart';
import 'package:shego/shared/theme/app_colors.dart';
import 'package:shego/shared/widgets/buttons/primary_buttons.dart';
import 'package:shego/shared/widgets/update_textFields.dart';
import '../viewmodels/home_veiwmodel.dart';
import '../widgets/lazy_loading_list.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                      "Sign up with Email",
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
                  "Welcome Back! Please enter your details.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "User Name",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              // With full customization
              UpdateTextField(
                applyPrefixIconColor: false,
                hintText: "Enter username",
                prefixIconPath: AppImages.userIcons,
                fillColor: AppColors.secondary,
                borderColor: AppColors.primary,
                focusedBorderColor: AppColors.primaryDark,
                borderRadius: 32,
                borderWidth: 1.0,
              ),
              SizedBox(height: 12),
              Text(
                "Email",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              // With full customization
              UpdateTextField(
                applyPrefixIconColor: false,
                hintText: "Enter Email",
                prefixIconPath: AppImages.email,
                fillColor: AppColors.secondary,
                borderColor: AppColors.primary,
                focusedBorderColor: AppColors.primaryDark,
                borderRadius: 32,
                borderWidth: 1.0,
              ),
              SizedBox(height: 12),
              Text(
                "Date of Birth",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              // With full customization
              UpdateTextField(
                applyPrefixIconColor: false,
                hintText: "DD-MM-YY",
                prefixIconPath: AppImages.calender,
                fillColor: AppColors.secondary,
                borderColor: AppColors.primary,
                focusedBorderColor: AppColors.primaryDark,
                borderRadius: 32,
                borderWidth: 1.0,
              ),
              SizedBox(height: 12),
              Text(
                "Password",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
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
              SizedBox(height: 12),
              Text(
                "Confirm Password",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
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

              SizedBox(height: 24),

              SizedBox(height: 26),
              PrimaryButton(
                onPressed: () {},
                text: "Sign Up",
                width: Get.width,
                radius: 4,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(RouteNames.login);
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
