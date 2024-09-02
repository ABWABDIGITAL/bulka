import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void verifySuccessBottomWidget(BuildContext context) {
  return AppBottomSheet.open(
    context: context,
    child: Column(
      children: [
        vSpace(40),
        Text(
          AppStrings.verifiedSuccessfully.tr(),
          style: TextStyles.rubik17W500Black,
        ),
        vSpace(20),
        Text(
          AppStrings.youHaveVerifiedYourEmailSuccess.tr(),
          style: TextStyles.rubik14W400MediumGrey4,
        ),
        vSpace(35),
        Image.asset(
          AssetImages.operationSuccess,
          height: 150.h,
          width: 150.w,
        ),
        vSpace(35),
        DefaultButton(
          onPressed: () {},
          text: AppStrings.home.tr(),
        )
      ],
    ),
  );
}
