import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultCategoryFieldSelectTypeWidget extends StatefulWidget {
  const DefaultCategoryFieldSelectTypeWidget(
    this.categoryFieldEntity, {
    super.key,
    required this.formKey,
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
    this.onFinish,
  });
  final CategoryFieldEntity categoryFieldEntity;
  final Function(List<CategoryFieldValuesEntity>? choosenFields)? onSelected;
  final Function(List<CreateAdCategoryField>? onFinish)? onFinish;
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
  final GlobalKey<FormState> formKey;
  @override
  State<DefaultCategoryFieldSelectTypeWidget> createState() =>
      _DefaultCategoryFieldMultiSelectDropDownWidgetState();
}

class _DefaultCategoryFieldMultiSelectDropDownWidgetState
    extends State<DefaultCategoryFieldSelectTypeWidget> {
  List<CategoryFieldValuesEntity>? _selectedFields;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 12.r),
            child: Text(
              widget.categoryFieldEntity.fieldName +
                  (widget.categoryFieldEntity.isRequired ? '*' : ""),
              style: widget.titleStyle ?? TextStyles.rubik13W500HardGrey2,
            ),
          ),
          FormBuilderCheckboxGroup<CategoryFieldValuesEntity>(
            name: 'categories',
            validator: widget.categoryFieldEntity.isRequired
                ? ((value) =>
                    value == null ? AppStrings.thisFieldIsRequired.tr() : null)
                : null,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? AppColors.scaffoldBackGround,
              errorMaxLines: widget.errorMaxLines ?? 2,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon ??
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.categoryFieldEntity.fieldIcon == null)
                        const Icon(
                          Icons.category_outlined,
                          color: AppColors.iconGrey,
                        ),
                      if (widget.categoryFieldEntity.fieldIcon != null)
                        DefaultNetworkImage(
                          widget.categoryFieldEntity.fieldIcon!,
                          width: 20,
                          height: 20,
                        )
                    ],
                  ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(color: AppColors.greyFont),
              hintStyle: TextStyles.rubik13W400IconGrey,
              hintText: widget.hintText ?? widget.categoryFieldEntity.fieldName,
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
            initialValue: _selectedFields,
            onChanged: (List<CategoryFieldValuesEntity>? newValue) {
              setState(() {
                _selectedFields = newValue;
              });
              if (widget.onSelected != null) {
                widget.onSelected!(newValue);
              }
              if (_selectedFields != null) {
                if (_selectedFields!.isEmpty) {
                  widget.onFinish?.call([]);
                } else {
                  List<CreateAdCategoryField> fields = [];
                  for (CategoryFieldValuesEntity element in _selectedFields!) {
                    fields.add(
                      CreateAdCategoryField(
                        id: widget.categoryFieldEntity.id,
                        fieldType: widget.categoryFieldEntity.fieldType.name,
                        fieldName: widget.categoryFieldEntity.fieldName,
                        fieldValue: element.fieldValue,
                      ),
                    );
                  }
                  widget.onFinish?.call(fields);
                }
              }
            },
            onSaved: (newValue) {
              if (widget.onSelected != null) {
                widget.onSelected!(newValue);
              }
            },
            options: widget.categoryFieldEntity.fieldValue
                .toSet()
                .map((CategoryFieldValuesEntity category) {
              return FormBuilderFieldOption<CategoryFieldValuesEntity>(
                value: category,
                child: Text(
                  category.fieldValue,
                  style: const TextStyle(color: AppColors.black),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
