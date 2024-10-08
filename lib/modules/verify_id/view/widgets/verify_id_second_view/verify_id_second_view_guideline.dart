import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class VerifyIdSecondViewGuideline extends StatelessWidget {
  final String title;
  const VerifyIdSecondViewGuideline({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         CircleAvatar(
          radius: 23,
          backgroundColor: AppColors.primary200.withOpacity(.5),
        ),
        hSpace(16),
        Text(title,style: TextStyles.rubik14W400DarkGrey2,)
      ],
    );
  }
}
