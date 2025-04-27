import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/coming_soon_screen.dart';
import 'package:swapgo/core/common/custom_appbar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(title: "FAVOURITES"),

      body: ComingSoonScreen(),
    );
  }
}
