import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Widget child;
  final TextEditingController controller;
  final int maxLines;
  final Widget? suffix;
  final double height;
  final bool isDescription;
  final TextInputType keyboardType;
  final String? errorText; // <-- errorText

  const AppTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.suffix,
    this.child = const SizedBox.shrink(),
    this.isDescription = false,
    this.height = 60,
    this.keyboardType = TextInputType.text,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final isMultiLine = maxLines > 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: AppTextStyle.font15SemiBold(
                fontFamily: AppFontFamily.inter,
              ),
            ),
            const Spacer(),
            if (isDescription) child,
          ],
        ),
        const SizedBox(height: 6),
        Container(
          constraints:
              isMultiLine
                  ? BoxConstraints(maxHeight: height)
                  : BoxConstraints.tightFor(height: height),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF0B3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: errorText != null ? Colors.red : Colors.black,
              width: 2,
            ),
          ),
          child: Row(
            crossAxisAlignment:
                isMultiLine
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    isCollapsed: false,
                    contentPadding: EdgeInsets.only(top: maxLines > 1 ? 15 : 0),
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              if (suffix != null) ...[const SizedBox(width: 8), suffix!],
            ],
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 4.0),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        const SizedBox(
          height: 16,
        ), // add spacing only below the field after error
      ],
    );
  }
}
