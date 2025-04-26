import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCrownTap;

  const CommonAppBar({Key? key, this.title, this.onSearchTap, this.onCrownTap})
    : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bottomNavbarColor,
      elevation: 2,
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: false,
      actions: [
        if (onSearchTap != null)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: onSearchTap,
          ),
        if (onCrownTap != null)
          IconButton(
            icon: const Icon(Icons.emoji_events_outlined, color: Colors.white),
            onPressed: onCrownTap,
          ),
      ],
    );
  }
}
