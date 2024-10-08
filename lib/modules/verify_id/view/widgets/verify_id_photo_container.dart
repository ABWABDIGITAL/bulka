import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdPhotoContainer extends StatelessWidget {
  final String image;
  final String title;
  const VerifyIdPhotoContainer({
    super.key,
    required this.image, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
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
            Image.asset(
              image,
              height: 100,
            ),
            vSpace(10),
            Text(title,
                style: TextStyles.rubik14W500DarkGrey),
            vSpace(10),
            Text(
              AppStrings.tapToUploadOrTakeAPhoto.tr(),
              style: TextStyles.rubik14W400MediumGrey5,
            ),
          ],
        ),
      ),
    );
  }
}
