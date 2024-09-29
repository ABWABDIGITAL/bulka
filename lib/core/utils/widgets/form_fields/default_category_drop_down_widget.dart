import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/categories/controller/category_cubit.dart';
import 'package:bulka/core/services/categories/controller/category_state.dart';
import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
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

class DefaultCategoryDropdownWidget extends StatefulWidget {
  const DefaultCategoryDropdownWidget({
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

  final Function(CategoryEntity? choosenCategory)? onSelected;
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
  State<DefaultCategoryDropdownWidget> createState() =>
      _DefaultCategoryDropdownWidgetState();
}

class _DefaultCategoryDropdownWidgetState
    extends State<DefaultCategoryDropdownWidget> {
  CategoryEntity? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(sl())..catgoriesStatesHandled(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        buildWhen: (previous, current) =>
            current is GetCategoriesLoading ||
            current is GetCategoriesSuccess ||
            current is GetCategoriesError,
        builder: (context, state) {
          final cubit = context.read<CategoryCubit>();
          if (state is GetCategoriesLoading) {
            return ShimmerContainerWidget(
              height: 45,
              width: MediaQuery.sizeOf(context).width,
            );
          }
          if (state is GetCategoriesError) {
            return ErrorScreen(
              error: state.error,
              onPressed: () {
                cubit.catgoriesStatesHandled();
              },
            );
          }
          if (cubit.categories != null || state is GetCategoriesSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 12.r),
                  child: Text(
                    widget.titleText ?? AppStrings.categories.tr(),
                    style: widget.titleStyle ?? TextStyles.rubik13W500HardGrey2,
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: FormBuilderDropdown<CategoryEntity>(
                    name: 'categories',
                    validator: (value) =>
                        value == null ? AppStrings.thisFieldIsRequired : null,
                    style: TextStyles.rubik13W600Black4
                        .copyWith(fontWeight: FontWeight.w300),
                    dropdownColor: AppColors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          widget.fillColor ?? AppColors.scaffoldBackGround,
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
                    initialValue: _selectedCategory,
                    onChanged: (CategoryEntity? newValue) {
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
                    items: cubit.categories!
                        .toSet()
                        .map((CategoryEntity category) {
                      return DropdownMenuItem<CategoryEntity>(
                        value: category,
                        child: Text(
                          category.name,
                          style: const TextStyle(color: AppColors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }
          return const Text('no state provided');
        },
      ),
    );
  }
}
