import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileBasicInfoWidget extends StatelessWidget {
  const ProfileBasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final profileTiles = [
      ProfileTileEntity(
        svgPath: AssetIcons.profileCircleSvg,
        title: AppStrings.contactInfo.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.verifySvg,
        svgColor: AppColors.black4,
        title: AppStrings.verifyId.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.workExperienceSvg,
        title: AppStrings.workExperience.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.educationSvg,
        title: AppStrings.education.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.languageSvg,
        title: AppStrings.languages.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.certificationSvg,
        title: AppStrings.certification.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.certificationSvg,
        title: AppStrings.cv.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.ticketDiscountSvg,
        title: AppStrings.packages.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.emptyWalletSvg,
        title: AppStrings.payments.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.callSvg,
        svgColor: AppColors.black,
        title: AppStrings.support.tr(),
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.basicInfo.tr(),
            style: TextStyles.rubik14W500MediumGrey7,
          ),
          vSpace(10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileTiles.length,
                (index) {
                  return profileTile(profileTiles[index])
                      .animate()
                      .fade(delay: (index * 750).ms);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileTile(ProfileTileEntity tile) {
    return ListTile(
      leading: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: AppColors.opactiyPrimary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              tile.svgPath,
              color: tile.svgColor,
              height: 22,
              width: 22,
            ),
          ],
        ),
      ),
      title: Text(
        tile.title,
        style: TextStyles.rubik13W600Black4,
      ),
      trailing: AssetTranslations.isRightDirectionality
          ? const Icon(Icons.arrow_back_ios, size: 16)
          : const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}

class ProfileTileEntity extends Equatable {
  const ProfileTileEntity({
    required this.svgPath,
    required this.title,
    this.svgColor,
  });
  final String svgPath;
  final Color? svgColor;
  final String title;

  @override
  List<Object?> get props => [svgPath, svgColor, title];
}
