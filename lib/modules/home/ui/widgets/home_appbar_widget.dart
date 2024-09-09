import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/badge_icon_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbarWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return CustomeAppBarWidget(
      height: height ?? 205.h,
      backgroundColor: AppColors.opactiyPrimary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.opactiyPrimary,
        statusBarIconBrightness: Brightness.dark,
      ),
      leading: const SizedBox(),
      leadingWidth: 0,
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/3c62/04e4/2dcf8a6490ff5dd9fa84762d8202f9a6?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=epMeSfJHG0HesokifMU1JQXl8SgofaxZRfT-Mdf2RV9TdddChZy6Jsjj8YyNKVT1BQxlxWYX-HfQqm0jwmkMbt3R1jEgzqA7sBtlJI3lT3PfDojvKu8qSyeeesDiW1Em80TLXk0iqQC0O3nj~m5OztR-oUXyuRGgmNH785NYfBhWYba~HXrfi7SGg9WIpd8zLGouOiPRXIBkQe8xhlj2WGZomOxepyJ-fTq0jCbi7FT-np18c5Jc4Zz3hTh~ZUxhg1y~BAcyOjJH5Y5VUi2~~rPvfYq61XTSoKWws8LNai7EWpkobh~aQwryInnj7e3TnRsO0qeHV2WO3pAmYC9A-Q__'),
              ),
              title: Text(
                'Welcome ,Abdullah 👋',
                style: TextStyles.rubik14W500LigtBlack,
              ),
              subtitle: Text(
                'Worry from free deals',
                style: TextStyles.rubik12W400DarkGrey4,
              ),
              trailing: const CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 22,
                child: BadgeIconWidget(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.r),
              child: DefaultFormField(
                needValidation: false,
                enabled: false,
                borderColor: AppColors.white,
                borderRadious: 12.r,
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetIcons.searchSvg,
                      height: 18.h,
                      width: 18.w,
                    ),
                  ],
                ),
                hintText: AppStrings.seachAboutSomeThingHere.tr(),
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetIcons.filterSvg,
                      height: 18.h,
                      width: 18.w,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 205.h);
}
