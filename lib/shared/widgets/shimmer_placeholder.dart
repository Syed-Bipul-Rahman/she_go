import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_colors.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerPlaceholder({super.key, this.width = 100, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(width: width, height: height, color: Colors.grey),
    );
  }
}
