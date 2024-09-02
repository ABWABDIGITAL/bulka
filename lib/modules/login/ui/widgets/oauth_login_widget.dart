import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OauthLoginWidget extends StatelessWidget {
  const OauthLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Row(
        children: [
          Expanded(
            child: DefaultButton(
              elevation: 0,
              borderRadiusValue: 12.r,
              backgroundColor: AppColors.white,
              borderColor: AppColors.grey,
              onPressed: () {
                // Navigator.pushNamed(context, AppStrings.signUp);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AssetIcons.facebook,
                    height: 22.h,
                    width: 22.w,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    AppStrings.google.tr(),
                    style: TextStyles.rubik13W500DarkGrey,
                  )
                ],
              ),
            ),
          ),
          hSpace(12),
          Expanded(
            child: DefaultButton(
              elevation: 0,
              borderRadiusValue: 12.r,
              backgroundColor: AppColors.white,
              borderColor: AppColors.grey,
              onPressed: () {
                // Navigator.pushNamed(context, AppStrings.signUp);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AssetIcons.google,
                    height: 22.h,
                    width: 22.w,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    AppStrings.google.tr(),
                    style: TextStyles.rubik13W500DarkGrey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
