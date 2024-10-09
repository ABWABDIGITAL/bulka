import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/about_us/view/screens/about_us_screen.dart';
import 'package:bulka/modules/faq/ui/screens/faq_screen.dart';
import 'package:bulka/modules/logout/view/widgets/logout_popup.dart';
import 'package:bulka/modules/profile/data/entities/profile_entity.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_list_tile_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePrivacyTermsWidget extends StatelessWidget {
  const ProfilePrivacyTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final profileTiles = [
      ProfileTileEntity(
        svgPath: AssetIcons.profileCircleSvg,
        title: AppStrings.contactInfo.tr(),
      ),
      ProfileTileEntity(
        svgPath: AssetIcons.aboutUsSvg,
        onTap: () {
          context.push(const AboutUsScreen());
        },
        title: AppStrings.aboutUs.tr(),
      ),
      ProfileTileEntity(
          svgPath: AssetIcons.faqSvg,
          title: AppStrings.faqs.tr(),
          onTap: () {
            context.push(const FAQScreen());
          }),
      ProfileTileEntity(
        svgPath: AssetIcons.logoutSvg,
        title: AppStrings.logout.tr(),
        svgColor: AppColors.black,
        onTap: () {
          showLogoutDialog(context);
        },
      ),
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpace(20),
          Text(
            AppStrings.privacyAndTerms.tr(),
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
                  return ProfileListTileWidget(tile: profileTiles[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
