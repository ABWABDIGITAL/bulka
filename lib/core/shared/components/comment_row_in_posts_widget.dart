import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommentRowInPostsWidget extends StatelessWidget {
  const CommentRowInPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.mediumGrey8,
          ),
          child: SvgPicture.asset(
            AssetIcons.heartSvg,
            height: 20.h,
            width: 20.w,
          ),
        ),
        hSpace(8),
        Expanded(
          child: Container(
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.mediumGrey8,
            ),
            child: Row(
              children: [
                hSpace(10),
                CircleAvatar(
                  radius: 12.r,
                  backgroundImage: const NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/a358/0c7c/1e35c5bdb1fdfbc222c05e4e3db5d318?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mmrD8xVhT75AxyaglUOe~xCk8FLzA36-GaPX9TkWI9tW-fbe3oBg7fdZqCIb4BaWYpxP7bG24yu12UczFThNisGxGFjiJZ-YziT45tNwV2R9iuPkaBXiBCmuOC1RP1044Pnfyhdzmfck9HQTFuWQ7wpAIHSE8h34lnbqr20VSyo-PzGE3~lMpDOhPsDw~LJaZr9HJfBEUNX8rVPhnOke8yLxhVeEesZtPaXNpdbWYzuEdX-w~HKrfxdm-OCZA5IdjHTwcrScnq~up81CB5J2qPDLJRe9oomfxW-Ayff9Fq6UCLF3dTqyOb1prX6DamDq1UsdzzRmIwwOPtf3dvD0pA__',
                  ),
                ),
                hSpace(10),
                Expanded(
                  child: Text(
                    AppStrings.commentHere.tr(),
                    style: TextStyles.roboto12W400IconGrey,
                  ),
                ),
                SvgPicture.asset(
                  AssetIcons.imageSvg,
                  height: 20.h,
                  width: 20.w,
                ),
                hSpace(10),
              ],
            ),
          ),
        ),
        hSpace(8),
        Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.mediumGrey8,
          ),
          child: SvgPicture.asset(
            AssetIcons.bookMarkSvg,
            height: 20.h,
            width: 20.w,
          ),
        ),
        hSpace(8),
        Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.mediumGrey8,
          ),
          child: SvgPicture.asset(
            AssetIcons.shareSvg,
            height: 20.h,
            width: 20.w,
          ),
        ),
      ],
    );
  }
}
