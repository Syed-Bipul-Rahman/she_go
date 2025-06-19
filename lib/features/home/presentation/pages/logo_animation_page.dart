import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shego/config/routes/app_router.dart';
import 'package:shego/config/routes/route_names.dart';
import 'package:shego/shared/theme/app_colors.dart';

import '../../../../core/utils/app_image.dart';

class LogoAnimationScreen extends StatefulWidget {
  const LogoAnimationScreen({super.key});

  @override
  State<LogoAnimationScreen> createState() => _LogoAnimationScreenState();
}

class _LogoAnimationScreenState extends State<LogoAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  String _displayText = '';
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _startAnimation();
  }

  void _startAnimation() async {
    // First animation: "Empowering"
    setState(() {
      _displayText = 'Empowering';
    });

    // Play zoom out animation for "Empowering"
    await _controller.forward();

    // Wait a bit before starting "Women" animation
    await Future.delayed(const Duration(milliseconds: 200));

    // Reset controller for "Women" animation
    _controller.reset();

    // Second animation: "Women"
    setState(() {
      _displayText = 'Women';
    });

    // Play zoom out animation for "Women"
    await _controller.forward();

    // Wait a bit before starting logo animation
    await Future.delayed(const Duration(milliseconds: 200));

    // Reset controller for logo animation
    _controller.reset();

    // Show logo and start its animation
    setState(() {
      _showLogo = true;
    });

    // Play zoom out animation for logo
    await _controller.forward();

    // Wait 1000ms after all animations complete
    await Future.delayed(const Duration(milliseconds: 1000));

    // Navigate to onboarding screen and remove all previous routes
    Get.offAllNamed(RouteNames.onboarding);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child:
                        _showLogo
                            ? SvgPicture.asset(
                              AppImages.appLogo,
                              height: 120,
                              width: 120,
                            )
                            : Text(
                              _displayText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
