import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:bulka/modules/navbar_layout/ui/views/navbar_layout_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void chooseInterestsSuccessDialog(BuildContext context) {
  return AppBottomSheet.open(
    context: context,
    child: Column(
      children: [
        vSpace(40),
        Text(
          AppStrings.successfullyBecomeExplorer.tr(),
          style: TextStyles.rubik17W500Black,
        ),
        vSpace(20),
        Text(
          AppStrings.exploreTheDealWithOtherPeople.tr(),
          style: TextStyles.rubik14W400MediumGrey4,
        ),
        Image.asset(
          AssetImages.operationSuccess,
          height: 150.h,
          width: 150.w,
        ),
        DefaultButton(
          onPressed: () {
            // context.push(const NavbarLayoutScreen());
            context.pushOffAll(const NavbarLayoutScreen());
          },
          text: AppStrings.letsExplore.tr(),
        )
      ],
    ),
  );
}
