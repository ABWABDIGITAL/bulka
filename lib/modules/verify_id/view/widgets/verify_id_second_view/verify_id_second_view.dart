import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdSecondView extends StatelessWidget {
  const VerifyIdSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: DottedBorder(
            color: AppColors.darkGrey6,
            borderType: BorderType.RRect,
            radius: Radius.circular(16.r),
            dashPattern: const [8, 4],
            strokeWidth: 1,
            child: Container(
              // height: 200.h,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Image.asset(AssetImages.selfPhoto),
                  vSpace(10),
                  Text('self photo', style: TextStyles.rubik14W500DarkGrey),
                  vSpace(10),
                  Text(
                    'Tap to upload image',
                    style: TextStyles.rubik14W400MediumGrey5,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
