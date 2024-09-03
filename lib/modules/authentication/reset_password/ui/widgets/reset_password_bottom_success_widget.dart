import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:bulka/modules/authentication/login/ui/views/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void resetPasswordSuccessBottomWidget(BuildContext context) {
  return AppBottomSheet.open(
    context: context,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          AppStrings.passwordSuccessfullyCreated.tr(),
          style: TextStyles.rubik17W500Black,
        ),
        Text(
          AppStrings.yourNewPasswordHaseBeenCreateSuccessfully.tr(),
          style: TextStyles.rubik14W400MediumGrey4,
          textAlign: TextAlign.center,
        ),
        Image.asset(
          AssetImages.operationSuccess,
          height: 150.h,
          width: 150.w,
        ),
        DefaultButton(
          onPressed: () {
            context.pushOffAll(const LoginScreen());
          },
          text: AppStrings.login.tr(),
        )
      ],
    ),
  );
}
