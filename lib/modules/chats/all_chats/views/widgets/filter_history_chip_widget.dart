import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class FilterHistoryChipWidget extends StatelessWidget {
  final String label;
  final Widget? avatar;
  const FilterHistoryChipWidget({
    super.key,
    required this.label,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: avatar,
      label: Text(label),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.grey),
      ),
      onSelected: (_) {},
    );
  }
}
