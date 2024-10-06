import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration defaultCategoryFieldInputDecorationWidget({
  final String? titleText,
  final Color? fillColor,
  final Color? borderColor,
  final int? errorMaxLines,
  final bool? enabled,
  final InputDecoration? decoration,
  final TextStyle? titleStyle,
  final TextStyle? style,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final String? labelText,
  final String? hintText,
  final double? borderRadious,
}) =>
    InputDecoration(
      filled: true,
      fillColor: fillColor ?? AppColors.scaffoldBackGround,
      errorMaxLines: errorMaxLines ?? 2,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon ??
          const Icon(
            Icons.category_outlined,
            color: AppColors.iconGrey,
          ),
      labelText: labelText,
      labelStyle: const TextStyle(color: AppColors.greyFont),
      hintStyle: TextStyles.rubik13W400IconGrey,
      hintText: hintText ?? AppStrings.exploreCategories.tr(),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? const Color(0xFFDCDCDC),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(borderRadious ?? 12.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? const Color(0xFFDCDCDC),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(borderRadious ?? 12.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFFF0000),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(borderRadious ?? 12.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadious ?? 12.r),
        borderSide: BorderSide(color: borderColor ?? AppColors.primary),
      ),
      contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? AppColors.red,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
