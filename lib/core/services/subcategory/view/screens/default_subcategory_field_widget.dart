import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/services/subcategory/controller/cubit/subcategory_cubit.dart';
import 'package:bulka/core/services/subcategory/controller/cubit/subcategory_state.dart';
import 'package:bulka/core/services/subcategory/data/entity/subcategory_entity.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultSubcategoryFieldWidget extends StatefulWidget {
  const DefaultSubcategoryFieldWidget({
    super.key,
    required this.params,
    required this.subcategoryCubit,
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
    this.needTitle = true,
    this.needValidation = false,
  });
  final SubcategoryParams? params;
  final Function(SubcategoryEntity? choosenSubCategory)? onSelected;
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
  final bool needTitle;
  final SubcategoryCubit subcategoryCubit;
  final bool needValidation;
  @override
  State<DefaultSubcategoryFieldWidget> createState() =>
      _DefaultSubcategoryFieldWidgetState();
}

class _DefaultSubcategoryFieldWidgetState
    extends State<DefaultSubcategoryFieldWidget> {
  SubcategoryEntity? _selectedSubCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.subcategoryCubit,
      child: BlocBuilder<SubcategoryCubit, SubcategoryState>(
        buildWhen: (previous, current) =>
            current is GetSubcategoryLoading ||
            current is GetSubcategorySuccess ||
            current is GetSubcategoryError,
        builder: (context, state) {
          final cubit = widget.subcategoryCubit;
          if (state is GetSubcategoryLoading) {
            return ShimmerContainerWidget(
              height: 45,
              width: MediaQuery.sizeOf(context).width,
            );
          }
          if (state is GetSubcategoryError) {
            return ErrorScreen(
              error: state.error,
              onPressed: () {
                if (widget.params != null) {
                  cubit.subcategoryStatesHandled(widget.params!);
                }
              },
            );
          }
          if (cubit.subcategories != null || state is GetSubcategorySuccess) {
            if (cubit.subcategories!.isEmpty) {
              return const SizedBox();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.needTitle)
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 12.r),
                    child: Text(
                      widget.titleText ?? AppStrings.categories.tr(),
                      style:
                          widget.titleStyle ?? TextStyles.rubik13W500HardGrey2,
                    ),
                  ),
                FormBuilderDropdown<SubcategoryEntity>(
                  name: 'subcategories',
                  validator: widget.needValidation
                      ? (value) => value == null
                          ? AppStrings.thisFieldIsRequired.tr()
                          : null
                      : null,
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
                    hintText:
                        widget.hintText ?? AppStrings.exploreCategories.tr(),
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
                      borderSide: BorderSide(
                          color: widget.borderColor ?? AppColors.primary),
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
                  initialValue: _selectedSubCategory,
                  onChanged: (SubcategoryEntity? newValue) {
                    setState(() {
                      _selectedSubCategory = newValue;
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
                  items: cubit.subcategories!
                      .toSet()
                      .map((SubcategoryEntity subcategory) {
                    return DropdownMenuItem<SubcategoryEntity>(
                      value: subcategory,
                      child: Text(
                        subcategory.name,
                        style: const TextStyle(color: AppColors.black),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
