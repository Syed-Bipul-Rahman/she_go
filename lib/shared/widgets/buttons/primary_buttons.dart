import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final Color? backgroundColor;
  final bool isActive;
  final String? svgAsset;
  final double iconSize;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.backgroundColor,
    this.isActive = true,
    this.iconSize = 20,
    this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Color(0xFF1F222A),
          backgroundColor:
              backgroundColor ??
              (isActive ? AppColors.primary : Color(0xFF1F222A)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgAsset != null) ...[
              SvgPicture.asset(
                svgAsset!,
                width: iconSize,
                height: iconSize,
                color: Colors.white,
              ),
              SizedBox(width: 8),
            ],
            Text(
              text,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
