import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final String? svgAsset;
  final double iconSize;
  final Color? borderColor;

  const SecondaryOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.svgAsset,
    this.iconSize = 20,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          side: BorderSide(color: borderColor ?? Colors.white, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
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
                color: borderColor,
              ),
              SizedBox(width: 8),
            ],
            Text(
              text,
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: borderColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
