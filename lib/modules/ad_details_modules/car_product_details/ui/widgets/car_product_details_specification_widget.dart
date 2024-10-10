import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarProductDetailsSpecificationWidget extends StatelessWidget {
  const CarProductDetailsSpecificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 20.r),
              child: Text(
                AppStrings.specification.tr(),
                style: TextStyles.rubik20W700Black,
              ),
            ),
            vSpace(12),
            SizedBox(
              height: 63.h,
              child: ListView.separated(
                padding: EdgeInsetsDirectional.only(start: 20.r),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mediumGrey13),
                      borderRadius: BorderRadius.circular(13.r),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 13.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          AssetIcons.fuelSvg,
                          height: 16.h,
                          width: 16.w,
                        ),
                        Text(
                          'Diesel',
                          style: TextStyles.mulish11W700Black2,
                        ),
                        Text(
                          'Common  Fuel Injection',
                          style: TextStyles.mulish8W400DarkGrey6,
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 8.r),
                itemCount: 6,
              ),
            )
          ],
        )
      ],
    );
  }
}
