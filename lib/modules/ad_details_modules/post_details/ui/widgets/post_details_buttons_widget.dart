import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PostDetailsButtonsWidget extends StatelessWidget {
  const PostDetailsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Card(
        color: AppColors.white,
        elevation: 5,
        shadowColor: AppColors.iconGrey,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20.r),
            topEnd: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  backgroundColor: AppColors.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetIcons.callSvg,
                      ),
                      hSpace(8),
                      Text(
                        AppStrings.phone.tr(),
                        style: TextStyles.rubik12W500White,
                      )
                    ],
                  ),
                ),
              ),
              hSpace(12),
              Expanded(
                  child: DefaultButton(
                backgroundColor: AppColors.white,
                borderColor: AppColors.primary300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AssetIcons.chatSvg),
                    hSpace(8),
                    Text(
                      AppStrings.message.tr(),
                      style: TextStyles.rubik12W500Primary400,
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
