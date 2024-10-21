import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdSecondViewGuideline extends StatelessWidget {
  final String title;
  final String image;
  const VerifyIdSecondViewGuideline(
      {super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 50.w,
          height: 50.h,
        ),
        hSpace(16),
        Text(
          title,
          style: TextStyles.rubik14W400DarkGrey2,
        )
      ],
    );
  }
}
