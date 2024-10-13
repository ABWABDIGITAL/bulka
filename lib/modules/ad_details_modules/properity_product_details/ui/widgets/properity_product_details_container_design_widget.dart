import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProperityProductDetailsContainerDesignWidget extends StatelessWidget {
  const ProperityProductDetailsContainerDesignWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.mediumGrey11,
      ),
      padding: EdgeInsets.all(20.r),
      child: child,
    );
  }
}
