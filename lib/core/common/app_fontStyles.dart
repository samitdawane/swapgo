import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swapgo/core/common/app_colors.dart';

enum AppFontFamily { raleway, inter }

class AppTextStyle {
  static TextStyle getFont({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    switch (fontFamily) {
      case AppFontFamily.inter:
        return GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );
      case AppFontFamily.raleway:
        return GoogleFonts.raleway(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );
    }
  }

  // Font Size 9
  // Font Size 12
  static TextStyle font12Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font12Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font12SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font12Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 13
  static TextStyle font13Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font13Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font13SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font13Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 13,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 14
  static TextStyle font14Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font14Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font14SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font14Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 15
  static TextStyle font15Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font15Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font15SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font15Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 16
  static TextStyle font16Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font16Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font16SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font16Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 17
  static TextStyle font17Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font17Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font17SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font17Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 18
  static TextStyle font18Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font18Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font18SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font18Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 20
  static TextStyle font20Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font20Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font20SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font20Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 24
  static TextStyle font24Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font24Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font24SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font24Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }

  // Font Size 26
  static TextStyle font26Regular({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 26,
      fontWeight: FontWeight.w400,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font26Medium({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font26SemiBold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: color,
      fontFamily: fontFamily,
    );
  }

  static TextStyle font26Bold({
    Color color = AppColors.textBlackColor,
    AppFontFamily fontFamily = AppFontFamily.raleway,
  }) {
    return getFont(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: color,
      fontFamily: fontFamily,
    );
  }
}
