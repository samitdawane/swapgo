import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.buttonColor,
    this.horizontalPadding = 30,
    this.verticalPadding = 14,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Text(
          text,
          style: AppTextStyle.font14Medium(
            color: Colors.white,
          ).copyWith(fontFamily: 'PublicSans'),
        ),
      ),
    );
  }
}
