import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropDownFormField({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: value == null ? null : Text(value!),
      validator: (value) {
        if (value == null) {
          return 'Please select an option';
        }
        return null;
      },
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primary,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.darkGrey3)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.darkGrey3)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.darkGrey3))),
      items: items.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
