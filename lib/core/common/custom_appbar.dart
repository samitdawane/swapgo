import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onCrownTap;

  const CustomAppBar({
    super.key,
    this.title,
    this.onSearchTap,
    this.onCrownTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          Navigator.canPop(context)
              ? InkWell(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_outlined, color: Colors.white),
              )
              : SizedBox.shrink(),

      backgroundColor: AppColors.bottomNavbarColor,
      elevation: 2,
      title: Text(
        title ?? '',
        style: AppTextStyle.font18SemiBold(color: Colors.white),
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
