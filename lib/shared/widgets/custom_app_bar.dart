import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), backgroundColor: AppColors.primary);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
