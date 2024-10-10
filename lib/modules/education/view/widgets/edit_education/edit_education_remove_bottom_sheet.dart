import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EducationRemoveBottomSheet extends StatelessWidget {
  const EducationRemoveBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${AppStrings.removeEducation.tr()} 🥲",
            style: TextStyles.rubik17W500Black,
          ),
          vSpace(16),
          Text(
            AppStrings.areYouSureYouWantToDeleteThisEducation.tr(),
            style: TextStyles.rubik14W400DarkGrey2,
          ),
          vSpace(16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyles.rubik14W500White,
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {},
                  child: Text(
                    AppStrings.yes.tr(),
                    style: TextStyles.rubik14W500White,
                  ),
                ),
              ),
              hSpace(8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyles.rubik14W500MediumGrey8,
                    backgroundColor: AppColors.mediumGrey15,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    AppStrings.no.tr(),
                    style: TextStyles.rubik14W500MediumGrey8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
