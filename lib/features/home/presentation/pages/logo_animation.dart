import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    // First animation: "SHE"
    setState(() {
      _displayText = 'SHE';
    });

    // Play zoom out animation for "SHE"
    await _controller.forward();

    // Wait a bit before starting "GO" animation
    await Future.delayed(const Duration(milliseconds: 200));

    // Reset controller for "GO" animation
    _controller.reset();

    // Second animation: "GO"
    setState(() {
      _displayText = 'GO';
    });

    // Play zoom out animation for "GO"
    await _controller.forward();

    // Show logo
    setState(() {
      _showLogo = true;
    });
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
            // SvgPicture.asset(AppImages.appLogo, height: 120, width: 120),
            if (!_showLogo)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                      child: Text(
                        _displayText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            if (_showLogo)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                      child: SvgPicture.asset(
                        AppImages.appLogo,
                        height: 120,
                        width: 120,
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
