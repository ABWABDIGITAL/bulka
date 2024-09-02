import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AdaptiveCircularProgress extends StatelessWidget {
  const AdaptiveCircularProgress({
    super.key,
    this.backgroundColor,
  });
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      backgroundColor: backgroundColor ?? AppColors.white,
      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
    );
  }
}
