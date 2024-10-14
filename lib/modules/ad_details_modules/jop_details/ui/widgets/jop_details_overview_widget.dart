import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JopDetailsOverviewWidget extends StatelessWidget {
  const JopDetailsOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSpace(20),
            Text(
              AppStrings.jobDescription.tr(),
              style: TextStyles.rubik16W500Black2,
            ),
            vSpace(12),
            CustomeExpandableText(
              'Seeking a User Experience Researcher to join our team. Conduct user research, collaborate with teams, plan and analyze studies, and present findings. Strong research background and attention to detail required. Apply now!',
              style: TextStyles.rubik14W400DarkGrey2,
            ),
            vSpace(34),
            Text(
              AppStrings.requirements.tr(),
              style: TextStyles.rubik16W500Black2,
            ),
            vSpace(12),
            ...List.generate(
              12,
              (index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 12.r),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetIcons.checkBlue,
                        height: 20.h,
                        width: 20.w,
                      ),
                      hSpace(10),
                      Text(
                        '+1 year Experience',
                        style: TextStyles.rubik14W400Black2,
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
