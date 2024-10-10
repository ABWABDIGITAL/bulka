import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddWorkExperienceDescription extends StatelessWidget {
  const AddWorkExperienceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.description.tr(), style: TextStyles.rubik14W500Black),
        vSpace(8),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: AppStrings.describeYourWorkExperience.tr(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.darkGrey3)),
          ),
        ),
      ],
    );
  }
}