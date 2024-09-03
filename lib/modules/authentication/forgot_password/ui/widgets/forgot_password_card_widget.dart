import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordCardWidget extends StatelessWidget {
  const ForgotPasswordCardWidget({
    super.key,
    this.child,
    this.height,
  });
  final Widget? child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(25.r),
          topEnd: Radius.circular(25.r),
        ),
      ),
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SizedBox(
          height: height ?? MediaQuery.sizeOf(context).height / 2.1,
          width: MediaQuery.sizeOf(context).width,
          child: child,
        ),
      ),
    );
  }
}
