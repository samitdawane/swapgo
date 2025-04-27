import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_images.dart';
import 'package:swapgo/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset(AppImages.splashImage, fit: BoxFit.cover),
      ),
    );
  }
}
