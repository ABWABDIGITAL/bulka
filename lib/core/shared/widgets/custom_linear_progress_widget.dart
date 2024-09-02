import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressWidget extends StatelessWidget {
  const CustomLinearProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppColors.secondary,
      color: AppColors.grey,
      minHeight: 2.h,
    );
  }
}
