import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContentWidget extends StatelessWidget {
  const OnboardingContentWidget({
    super.key,
    required this.data,
  });
  final OnboardingContentData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              data.imagePath,
              fit: BoxFit.contain,
              height: 220.h,
            ),
            Text(
              data.title,
              style: TextStyles.rubik20W500Black,
            ),
            vSpace(16),
            Text(
              data.subtitle,
              textAlign: TextAlign.center,
              style: TextStyles.rubik18W300HardGrey,
            ),
          ],
        ),
        Image.asset(
          AssetImages.stars,
          height: 200,
        ),
      ],
    );
  }
}

class OnboardingContentData extends Equatable {
  const OnboardingContentData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
  final String imagePath;
  final String title;
  final String subtitle;

  @override
  List<Object?> get props => [imagePath, title, subtitle];
}
