import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCompanySizeDropdownWidget extends StatefulWidget {
  const DefaultCompanySizeDropdownWidget({
    super.key,
    this.onSelected,
    this.borderColor,
    this.borderRadious,
    this.decoration,
    this.enabled,
    this.errorMaxLines,
    this.fillColor,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.style,
    this.suffixIcon,
    this.titleStyle,
    this.titleText,
  });

  final Function(String? choosenSize)? onSelected;
  final String? titleText;
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

  @override
  State<DefaultCompanySizeDropdownWidget> createState() =>
      _DefaultCompanySizeDropdownWidgetState();
}

class _DefaultCompanySizeDropdownWidgetState
    extends State<DefaultCompanySizeDropdownWidget> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'large',
      'medium',
      'small',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 12.r),
          child: Text(
            widget.titleText ?? AppStrings.companySize.tr(),
            style: widget.titleStyle ?? TextStyles.rubik13W500HardGrey2,
          ),
        ),
        SizedBox(
          height: 45,
          child: FormBuilderDropdown<String>(
            name: 'company size',
            validator: (value) =>
                value == null ? AppStrings.thisFieldIsRequired : null,
            style: TextStyles.rubik13W600Black4
                .copyWith(fontWeight: FontWeight.w300),
            dropdownColor: AppColors.white,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? AppColors.scaffoldBackGround,
              errorMaxLines: widget.errorMaxLines ?? 2,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon ??
                  const Icon(
                    Icons.architecture_rounded,
                    color: AppColors.iconGrey,
                  ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: AppColors.greyFont),
              hintStyle: TextStyles.rubik13W400IconGrey,
              hintText: widget.hintText ?? AppStrings.enterCompanySize.tr(),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFFDCDCDC),
                  width: 1.0,
                ),
                borderRadius:
                    BorderRadius.circular(widget.borderRadious ?? 12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xFFDCDCDC),
                  width: 1.0,
                ),
                borderRadius:
                    BorderRadius.circular(widget.borderRadious ?? 12.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFFFF0000),
                  width: 1.0,
                ),
                borderRadius:
                    BorderRadius.circular(widget.borderRadious ?? 12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.borderRadious ?? 12.r),
                borderSide:
                    BorderSide(color: widget.borderColor ?? AppColors.primary),
              ),
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            initialValue: _selectedSize,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSize = newValue;
              });
              if (widget.onSelected != null) {
                widget.onSelected!(newValue);
              }
            },
            onSaved: (newValue) {
              if (widget.onSelected != null) {
                widget.onSelected!(newValue);
              }
            },
            items: List.generate(
              items.length,
              (index) {
                return DropdownMenuItem<String>(
                  value: items[index],
                  child: Text(
                    items[index],
                    style: const TextStyle(color: AppColors.black),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
