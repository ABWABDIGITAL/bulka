import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_cubit.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_state.dart';
import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_boolean_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_check_type_drop_down_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_select_type_drop_down_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_integer_type_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_text_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultCategoryFieldsWidget extends StatefulWidget {
  const DefaultCategoryFieldsWidget({
    super.key,
    required this.params,
    required this.categoryFieldsCubit,
    this.onFinish,
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
  final CategoryFieldParams params;
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
  final CategoryFieldsCubit categoryFieldsCubit;
  @override
  State<DefaultCategoryFieldsWidget> createState() =>
      _DefaultCategoryFieldsWidgetState();
}

class _DefaultCategoryFieldsWidgetState
    extends State<DefaultCategoryFieldsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.categoryFieldsCubit,
      child: BlocBuilder<CategoryFieldsCubit, CategoryFieldsState>(
        buildWhen: (previous, current) =>
            current is GetCategoryFieldsLoading ||
            current is GetCategoryFieldsSuccess ||
            current is GetCategoryFieldsError,
        builder: (context, state) {
          final cubit = context.read<CategoryFieldsCubit>();
          if (state is GetCategoryFieldsLoading) {
            return ShimmerContainerWidget(
              height: 45,
              width: MediaQuery.sizeOf(context).width,
            );
          }
          if (state is GetCategoryFieldsError) {
            return ErrorScreen(
              error: state.error,
              onPressed: () {
                cubit.categoryFieldsStatesHandled(widget.params);
              },
            );
          }
          if (cubit.categoryFields != null ||
              state is GetCategoryFieldsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                cubit.categoryFields!.length,
                (index) {
                  switch (cubit.categoryFields![index].fieldType) {
                    case CategoryFieldTypes.text:
                      return DefaultCategoryFieldTextWidget(
                        cubit.categoryFields![index],
                        onFinish: (onFinish) {
                          cubit.setSelectedCategoriesFields = onFinish;
                        },
                        formKey: cubit.dynamicKeys[index],
                      );
                    case CategoryFieldTypes.integer:
                      return DefaultCategoryFieldIntegerWidget(
                        cubit.categoryFields![index],
                        onFinish: (onFinish) {
                          cubit.setSelectedCategoriesFields = onFinish;
                        },
                        formKey: cubit.dynamicKeys[index],
                      );
                    case CategoryFieldTypes.check:
                      return DefaultCategoryFieldCheckTypeDropDownWidget(
                        cubit.categoryFields![index],
                        onFinish: (onFinish) {
                          cubit.setSelectedCategoriesFields = onFinish;
                        },
                        fromKey: cubit.dynamicKeys[index],
                      );
                    case CategoryFieldTypes.select:
                      return DefaultCategoryFieldSelectTypeWidget(
                        cubit.categoryFields![index],
                        onFinish: (onFinish) {
                          if (onFinish != null) {
                            cubit.setSelectedCategoriesFields = onFinish;
                          }
                        },
                        formKey: cubit.dynamicKeys[index],
                      );
                    case CategoryFieldTypes.boolean:
                      return DefaultCategoryFieldBooleanWidget(
                        cubit.categoryFields![index],
                      );
                    // case CategoryFieldTypes.multiselect:
                    //   return DefaultCategoryFieldMultiSelectWidget(
                    //     cubit.categoryFields![index],
                    //   );
                    default:
                      return const Text('category field type not supported');
                  }
                },
              ),
            );
          }
          return const Text('no state provided');
        },
      ),
    );
  }
}
