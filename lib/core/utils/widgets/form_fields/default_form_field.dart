import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.width,
    this.prefixIcon,
    this.suffixIcon,
    this.needValidation = true,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.errorMaxLines,
    this.enabled = true,
    this.fillColor,
    this.borderColor,
    this.verticalEdge,
    this.initialValue,
    this.labelColor,
    this.maxLines,
    this.textColor,
    this.controller,
    this.onChanged,
    this.elevation,
    this.padding,
    this.margin,
    this.prefixIconConstraints,
    this.maxLength = -1,
    this.borderRadious,
    this.titleText,
    this.decoration,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textInputAction,
    this.onTapOutside,
    this.titleFontWeight,
    this.titleFontSize,
    this.autovalidateMode,
    this.titleStyle,
    this.style,
    this.hintStyle,
    this.onTap,
    this.minLines,
  });

  final String? labelText;
  final String? hintText;
  final void Function(String? newValue)? onSaved;
  final double? width;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? needValidation;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool? obscureText;
  final int? errorMaxLines;
  final bool? enabled;
  final Color? fillColor;
  final Color? borderColor;
  final double? verticalEdge;
  final String? initialValue;
  final Color? labelColor;
  final TextStyle? hintStyle;
  final int? maxLines;
  final Color? textColor;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  final double? borderRadious;
  final String? titleText;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final void Function(PointerDownEvent)? onTapOutside;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? titleStyle;
  final TextStyle? style;
  final void Function()? onTap;
  final int? minLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: verticalEdge ?? 0),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (titleText != null)
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 12.r),
                child: Text(
                  titleText!,
                  style: titleStyle ?? TextStyles.rubik13W500HardGrey2,
                ),
              ),
            Padding(
              padding: titleText != null
                  ? const EdgeInsetsDirectional.only(bottom: 0)
                  : EdgeInsets.zero,
              child: TextFormField(
                
                onTap: onTap,
                onTapOutside: onTapOutside ??
                    (pointer) {
                      FocusScope.of(context).unfocus();
                    },
                textInputAction: textInputAction,
                maxLength: maxLength == -1 ? null : maxLength,
                inputFormatters: inputFormatters,
                cursorColor: AppColors.primary,
                cursorHeight: 20,
                cursorWidth: 1,
                validator: validator ??
                    (needValidation!
                        ? (value) => value!.isEmpty
                            ? AppStrings.thisFieldIsRequired.tr()
                            : null
                        : null),
                autovalidateMode:
                    autovalidateMode ?? AutovalidateMode.onUserInteraction,
                keyboardType: keyboardType,
                controller: controller,
                obscureText: obscureText!,
                enabled: enabled,
                onFieldSubmitted: onFieldSubmitted,
                initialValue: initialValue,
                onSaved: onSaved,
                maxLines: maxLines == -1 ? null : maxLines ?? 1,
                minLines: minLines,
                onChanged: onChanged,
                style: style ?? TextStyle(color: textColor ?? AppColors.black),
                decoration: decoration ??
                    InputDecoration(
                      filled: true,
                      fillColor: fillColor ?? AppColors.scaffoldBackGround,
                      errorMaxLines: errorMaxLines ?? 2,
                      suffixIcon: suffixIcon,
                      prefixIconConstraints: prefixIconConstraints,
                      prefixIcon: prefixIcon,
                      labelText: labelText,
                      labelStyle: labelColor != null
                          ? TextStyle(color: labelColor ?? AppColors.greyFont)
                          : TextStyles.dummy,
                      hintStyle: hintStyle ?? TextStyles.rubik13W400IconGrey,
                      hintText: hintText,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? const Color(0xFFDCDCDC),
                          width: 1.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(borderRadious ?? 12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? const Color(0xFFDCDCDC),
                          width: 1.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(borderRadious ?? 12.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF0000),
                          width: 1.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(borderRadious ?? 12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(borderRadious ?? 12.r),
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
            ),
          ],
        ),
      ),
    );
  }
}
