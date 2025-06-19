import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle titleStyle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.titleStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      leading:
          showBackButton
              ? GestureDetector(
                onTap: onBackPressed ?? () => Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back, color: iconColor),
              )
              : null,
      title: Text(title, style: titleStyle),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
