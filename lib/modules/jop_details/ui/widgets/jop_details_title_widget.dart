import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JopDetailsTitleWidget extends StatelessWidget {
  const JopDetailsTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Container(
                height: 150.h,
                color: AppColors.opactiyPrimary,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundColor: AppColors.white,
                  child: CircleAvatar(
                    radius: 45.r,
                    backgroundColor: AppColors.softGrey5,
                    backgroundImage:
                        const AssetImage(AssetImages.companyLogoJustForTest),
                  ),
                ),
              ),
              PositionedDirectional(
                top: 20.h,
                end: 20.w,
                child: Container(
                  height: 37.h,
                  width: 37.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.black.withOpacity(.3),
                  ),
                  child: SvgPicture.asset(
                    AssetIcons.bookMarkSvg,
                    height: 20.h,
                    width: 20.w,
                    color: AppColors.white,
                  ),
                ),
              ),
              PositionedDirectional(
                top: 20.h,
                start: 20.w,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 37.h,
                    width: 37.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.black.withOpacity(.3),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          'UX Researcher',
          style: TextStyles.rubik19W500Black5,
        ),
        vSpace(14),
        Text(
          'Moonlight , Egypt',
          style: TextStyles.rubik14W400Black2,
        ),
        vSpace(18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 45.h,
              width: 130.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Text(
                'Freelance',
                style: TextStyles.rubik15W500Primary,
              ),
            ),
            hSpace(12),
            Container(
              height: 45.h,
              width: 130.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.05),
                borderRadius: BorderRadius.circular(11.r),
              ),
              child: Text(
                'Remote',
                style: TextStyles.rubik15W500Primary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
