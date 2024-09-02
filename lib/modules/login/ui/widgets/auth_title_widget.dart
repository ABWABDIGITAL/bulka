import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({
    super.key,
    this.description,
    this.title,
    this.textAlign,
    this.needStartEffect = true,
  });
  final String? title;
  final String? description;
  final TextAlign? textAlign;
  final bool needStartEffect;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset(
                  AssetImages.rightClipperImage,
                  height: 113.h,
                  width: 20.w,
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Image.asset(
                    AssetIcons.appGreyIconX4,
                    height: 40.h,
                    width: 32.w,
                    fit: BoxFit.contain,
                  ),
                  vSpace(30),
                  Text(
                    title ?? AppStrings.loginToUs.tr(),
                    style: TextStyles.rubik16W500HardGrey2,
                    textAlign: textAlign,
                  ),
                  vSpace(12),
                  Text(
                    description ??
                        AppStrings.weMakeItEasyToBuyAndSellRealState.tr(),
                    style: TextStyles.rubik15W400SoftGrey,
                    textAlign: textAlign,
                  ),
                ],
              ),
            ),
            Image.asset(
              AssetImages.leftClipperImage,
              height: 113.h,
              width: 20.w,
            ),
          ],
        ),
        if (needStartEffect)
          Opacity(
            opacity: .7,
            child: Image.asset(
              AssetImages.stars,
              height: 200,
            ),
          ),
      ],
    );
  }
}
