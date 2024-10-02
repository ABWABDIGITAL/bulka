import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCategoryFieldDropDownWidget extends StatefulWidget {
  const DefaultCategoryFieldDropDownWidget(
    this.categoryFieldEntity, {
    super.key,
    this.titleText,
    this.fillColor,
    this.borderColor,
    this.errorMaxLines,
    this.enabled,
    this.decoration,
    this.titleStyle,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.borderRadious,
    this.onSelected,
  });
  final CategoryFieldEntity categoryFieldEntity;
  final Function(CategoryFieldEntity? choosenCategory)? onSelected;
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
  State<DefaultCategoryFieldDropDownWidget> createState() =>
      _DefaultCategoryFieldDropDownWidgetState();
}

class _DefaultCategoryFieldDropDownWidgetState
    extends State<DefaultCategoryFieldDropDownWidget> {
  CategoryFieldEntity? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 12.r),
          child: Text(
            widget.categoryFieldEntity.fieldName,
            style: widget.titleStyle ?? TextStyles.rubik13W500HardGrey2,
          ),
        ),
        SizedBox(
          height: 45,
          child: FormBuilderDropdown<CategoryFieldEntity>(
            name: 'categories',
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
                    Icons.category_outlined,
                    color: AppColors.iconGrey,
                  ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: AppColors.greyFont),
              hintStyle: TextStyles.rubik13W400IconGrey,
              hintText: widget.hintText ?? AppStrings.exploreCategories.tr(),
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
            initialValue: _selectedCategory,
            onChanged: (CategoryFieldEntity? newValue) {
              setState(() {
                _selectedCategory = newValue;
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
            items: widget.categoryFieldEntity.fieldValue
                .toSet()
                .map((dynamic category) {
              return DropdownMenuItem<CategoryFieldEntity>(
                value: category,
                child: Text(
                  category,
                  style: const TextStyle(color: AppColors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
