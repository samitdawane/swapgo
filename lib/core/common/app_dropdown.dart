import 'package:flutter/material.dart';
import 'package:swapgo/core/common/app_colors.dart';
import 'package:swapgo/core/common/app_fontStyles.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final String? errorText;
  final ValueChanged<String?> onChanged;

  const AppDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: errorText != null ? Colors.red : Colors.black,
              width: 2,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              value: value,
              hint: Text("Select $label"),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              onChanged: onChanged,
              items:
                  items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              errorText!,
              style: AppTextStyle.font12Medium(
                color: Colors.red,
                fontFamily: AppFontFamily.inter,
              ),
            ),
          ),
      ],
    );
  }
}
