import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomeSmoothIndicator extends StatelessWidget {
  const CustomeSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: ExpandingDotsEffect(
        expansionFactor: 1.1,
        spacing: 8.0,
        radius: 16.0,
        dotWidth: 8.r,
        dotHeight: 8.r,
        dotColor: AppColors.primary.withOpacity(.2),
        activeDotColor: AppColors.primary,
        paintStyle: PaintingStyle.fill,
      ),
    );
  }
}
