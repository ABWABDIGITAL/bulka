import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailsInfoWidget extends StatelessWidget {
  const PostDetailsInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sifa Carpet Hand Woven',
            style: TextStyles.rubik16W500Black3,
          ),
          vSpace(20),
          CustomeExpandableText(
            'Made By High Quality Super Soft Microfiber And Cotton Yarn. Material microfiber with soft touch under feet Wash Care easy wash with cold detergent water Made By High Quality Super Soft Microfiber And Cotton Yarn',
            style: TextStyles.rubik14W400DarkGrey2.copyWith(
              fontSize: 12.sp,
            ),
          ),
          vSpace(20),
          Text(
            '10,000 \$',
            style: TextStyles.rubik20W500Primary200,
          ),
        ],
      ),
    );
  }
}
