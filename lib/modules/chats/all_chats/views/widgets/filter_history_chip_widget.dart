import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class FilterHistoryChipWidget extends StatelessWidget {
  final String label;
  final Widget? avatar;
  final bool isLoading;
  final bool isSelected;
  const FilterHistoryChipWidget({
    super.key,
    required this.label,
    this.avatar,
    this.isLoading = false,
    this.isSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: ShimmerContainerWidget(
        isLoading: isLoading,
        height: 20,
        child: avatar,
      ),
      label: ShimmerTextWidget(
        label,
        isLoading: isLoading,
        style: isSelected
            ? TextStyles.mulish12W400Black.copyWith(fontWeight: FontWeight.bold)
            : TextStyles.mulish12W400Black,
      ),
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.grey),
      ),
      selected: isSelected,
      selectedColor: AppColors.opactiyPrimary,
      showCheckmark: false,
      onSelected: isLoading ? (_) {} : (_) {},
    );
  }
}
