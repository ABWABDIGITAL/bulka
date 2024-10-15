import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfferStartAndEndDate extends StatelessWidget {
  final String startDate;
  final String endDate;
  const OfferStartAndEndDate({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.darkGrey6,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.startDate.tr(),
                  style: TextStyles.rubik14W400MediumGrey5),
              Text(DateFormats.formatDateMdyyyy(startDate),
                  style: TextStyles.rubik12W500DarkGold),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.endDate.tr(),
                  style: TextStyles.rubik14W400MediumGrey5),
              Text(DateFormats.formatDateMdyyyy(endDate),
                  style: TextStyles.rubik12W500DarkGold),
            ],
          ),
        ],
      ),
    );
  }
}
