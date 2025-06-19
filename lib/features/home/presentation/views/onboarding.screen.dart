import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shego/config/routes/app_router.dart';
import 'package:shego/config/routes/route_names.dart';
import 'package:shego/shared/widgets/buttons/primary_buttons.dart';

import '../../../../core/utils/app_image.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.onboardingImage),
              SizedBox(height: 24),
              Text(
                textAlign: TextAlign.center,
                "Ride Easy - Book Fast\nYour Journey Starts Here!",
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24),
              Text(
                textAlign: TextAlign.center,
                "Welcome to Alba Ryde, experience safe and efficient taxi service across Albania. From historic sites to stunning beach landscapes, and timely airport transfers.",
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24),
              PrimaryButton(
                radius: 4,
                onPressed: () {
                  Get.toNamed(RouteNames.joinAs);
                },
                text: "Get started",
                width: Get.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
