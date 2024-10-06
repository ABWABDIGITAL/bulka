import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BuildForgotPasswordReturnMethodCircleWidget extends StatelessWidget {
  const BuildForgotPasswordReturnMethodCircleWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.svgPath,
  });
  final void Function()? onTap;
  final bool isSelected;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor:
            isSelected ? const Color(0xFF85A0FF) : AppColors.softGrey1,
        radius: 23.r,
        child: CircleAvatar(
          radius: 22.r,
          backgroundColor:
              isSelected ? const Color(0xFF85A0FF) : AppColors.grey,
          child: SvgPicture.asset(
            svgPath,
            color: isSelected ? AppColors.white : AppColors.mediumGrey5,
          ),
        ),
      ),
    );
  }
}
