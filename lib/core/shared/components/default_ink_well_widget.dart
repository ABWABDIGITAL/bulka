import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeInkWellWidget extends StatelessWidget {
  const CustomeInkWellWidget({
    super.key,
    this.onTap,
    this.child,
  });
  final void Function()? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      splashColor: AppColors.transparent,
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      child: child,
    );
  }
}
