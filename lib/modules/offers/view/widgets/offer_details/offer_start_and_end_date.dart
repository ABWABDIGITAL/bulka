
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class OfferStartAndEndDate extends StatelessWidget {
  const OfferStartAndEndDate({
    super.key,
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
              Text("Start date",
                  style: TextStyles.rubik14W400MediumGrey5),
              Text("18 Jan, 2024",
                  style: TextStyles.rubik12W500DarkGold),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("End date",
                  style: TextStyles.rubik14W400MediumGrey5),
              Text("25 Jan, 2024",
                  style: TextStyles.rubik12W500DarkGold),
            ],
          ),
        ],
      ),
    );
  }
}
