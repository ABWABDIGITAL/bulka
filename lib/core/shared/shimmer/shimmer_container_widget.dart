import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerWidget extends StatelessWidget {
  const ShimmerContainerWidget({
    super.key,
    this.height,
    this.width,
    this.borderRadiusValue,
    this.margin,
    this.padding,
    this.decoration,
    this.child,
  });
  final double? height;
  final double? width;
  final double? borderRadiusValue;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height ?? 3.h,
        width: width ?? 100.w,
        margin: margin,
        padding: padding,
        alignment: Alignment.center,
        decoration: decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusValue ?? 8.r),
              color: AppColors.grey,
            ),
        child: child,
      ),
    );
  }
}
