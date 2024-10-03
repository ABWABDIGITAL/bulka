import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InterestsSkipWidget extends StatelessWidget {
  const InterestsSkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.skip.tr(),
              style: TextStyles.rubik14W600Primary.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
