import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/certifications/ui/views/add_certifications_screen.dart';
import 'package:bulka/modules/contact_info/ui/views/contact_info_screen.dart';
import 'package:bulka/modules/cv/ui/views/add_cv_screen.dart';
import 'package:bulka/modules/languages/ui/views/choose_languages_screen.dart';
import 'package:bulka/modules/offers/view/screens/offers_screen.dart';
import 'package:bulka/modules/profile/data/entities/profile_entity.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_list_tile_widget.dart';
import 'package:bulka/modules/profile_location/view/screens/profile_add_location_screen.dart';
import 'package:bulka/modules/verify_id/view/screens/verify_id_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBasicInfoWidget extends StatelessWidget {
  const ProfileBasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final profileTiles = [
      ProfileTileEntity(
          svgPath: AssetIcons.profileCircleSvg,
          title: AppStrings.contactInfo.tr(),
          onTap: () {
            context.push(const ContactInfoScreen());
          }),
      ProfileTileEntity(
        svgPath: AssetIcons.verifySvg,
        svgColor: AppColors.black4,
        onTap: () {
          context.push(const VerifyIdScreen());
        },
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
          onTap: () {
            context.push(const ChooseLanguagesScreen());
          }),
      ProfileTileEntity(
          svgPath: AssetIcons.certificationSvg,
          title: AppStrings.certification.tr(),
          onTap: () {
            context.push(const AddCertificationsScreen());
          }),
      ProfileTileEntity(
          svgPath: AssetIcons.certificationSvg,
          title: AppStrings.cv.tr(),
          onTap: () {
            context.push(const AddCvScreen());
          }),
      ProfileTileEntity(
          svgPath: AssetIcons.locationOutlineSvg,
          title: AppStrings.location.tr(),
          onTap: () {
            context.push(const ProfileAddLocationScreen());
          }),
      ProfileTileEntity(
        svgPath: AssetIcons.ticketDiscountSvg,
        title: AppStrings.packages.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.boxTickActive,
        svgColor: AppColors.black,
        onTap: () {
          context.push(const OffersScreen());
        },
        title: AppStrings.offers.tr(),
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
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                profileTiles.length,
                (index) {
                  return ProfileListTileWidget(tile: profileTiles[index])
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
}
