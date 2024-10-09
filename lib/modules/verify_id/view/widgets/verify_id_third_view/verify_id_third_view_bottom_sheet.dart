import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifyIdThirdViewBottomSheet extends StatelessWidget {
  const VerifyIdThirdViewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AssetIcons.checkBlue),
          vSpace(30),
          Text(
            AppStrings.yourIdProofHasBeenSubmitted.tr(),
            style: TextStyles.rubik17W500Black,
            textAlign: TextAlign.center,
          ),
          vSpace(10),
          Text(
            AppStrings.weWillReviewAndLetYouKnow.tr(),
            style: TextStyles.rubik14W400DarkGrey2,
            textAlign: TextAlign.center,
          ),
          vSpace(40),
          DefaultButton(
            onPressed: () {
              context.pop();
            },
            text: AppStrings.done.tr(),
          ),
        ],
      ),
    );
  }
}
