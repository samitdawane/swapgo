import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.bottomNavbarColor,
      selectedItemColor: AppColors.textBlackColor,
      unselectedItemColor: Colors.black54,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: [
        buildNavItem(Icons.home_outlined, 0),
        buildNavItem(Icons.star_border, 1),
        buildNavItem(Icons.swap_horiz, 2),
        buildNavItem(Icons.person_outline, 3),
      ],
    );
  }

  BottomNavigationBarItem buildNavItem(IconData iconData, int index) {
    bool isSelected = selectedIndex == index;

    return BottomNavigationBarItem(
      icon:
          isSelected
              ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bottomNavbarContainerColor,
                ),
                child: Icon(iconData, color: AppColors.textBlackColor),
              )
              : Icon(iconData, color: Colors.black54),
      label: '',
    );
  }
}
