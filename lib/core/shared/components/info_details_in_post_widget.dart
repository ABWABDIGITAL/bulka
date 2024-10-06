import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDetailsInPostWidget extends StatelessWidget {
  const InfoDetailsInPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Mercedes AMG G63',
                style: TextStyles.roboto14W600Black2,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 7.r, horizontal: 12.r),
              child: Text(
                '3,000,000 EGP',
                style: TextStyles.roboto14W600Black2,
              ),
            )
          ],
        ),
        vSpace(16),
        CustomeExpandableText(
          "Inside the wagon AMG, we don't know which is morecolor we don't know which is more surprising Excepteur ex cillum non nisi sunt consequat duis consequat sint ullamco. Inside the wagon AMG, we don't know which is morecolor we don't know which is more surprising Excepteur ex cillum non nisi sunt consequat duis consequat sint ullamco.",
          style: TextStyles.roboto12W400IconGrey,
        ),
      ],
    );
  }
}
