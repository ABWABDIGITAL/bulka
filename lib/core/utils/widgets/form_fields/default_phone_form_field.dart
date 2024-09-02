import 'dart:async';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class DefaultPhoneFormField extends StatelessWidget {
  DefaultPhoneFormField({
    super.key,
    this.borderColor,
    this.borderRadious,
    this.decoration,
    this.enabled,
    this.errorMaxLines,
    this.fillColor,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.onCountryChanged,
    this.prefixIcon,
    this.style,
    this.suffixIcon,
    this.titleStyle,
    this.validator,
    this.titleText,
    this.needTitleText = true,
    this.controller,
  });
  final FocusNode focusNode = FocusNode();
  final Color? fillColor;
  final Color? borderColor;
  final int? errorMaxLines;
  final bool? enabled;
  final InputDecoration? decoration;
  final TextStyle? titleStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final double? borderRadious;
  final void Function(PhoneNumber phone)? onChanged;
  final void Function(Country country)? onCountryChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final String? titleText;
  final bool? needTitleText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (needTitleText!)
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 12.r),
            child: Text(
              titleText ?? AppStrings.phoneNumber.tr(),
              style: titleStyle ?? TextStyles.rubik13W500HardGrey2,
            ),
          ),
        Theme(
          data: ThemeData(
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          child: IntlPhoneField(
            focusNode: focusNode,
            validator: validator,
            controller: controller,
            invalidNumberMessage: 'Invalid phone number'.tr(),
            pickerDialogStyle: PickerDialogStyle(
              searchFieldInputDecoration: InputDecoration(
                hintText: 'Search'.tr(),
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
                  borderSide:
                      BorderSide(color: borderColor ?? AppColors.primary),
                ),
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColors.red,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? AppColors.scaffoldBackGround,
              errorMaxLines: errorMaxLines ?? 2,
              suffixIcon: suffixIcon ??
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetIcons.call,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
              prefixIcon: prefixIcon,
              labelText: labelText,
              labelStyle: const TextStyle(color: AppColors.greyFont),
              hintStyle: TextStyles.rubik13W400IconGrey,
              hintText: hintText,
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
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            languageCode: AssetTranslations.english.locale.languageCode,
            onChanged: onChanged,
            onCountryChanged: onCountryChanged,
          ),
        ),
      ],
    );
  }
}
