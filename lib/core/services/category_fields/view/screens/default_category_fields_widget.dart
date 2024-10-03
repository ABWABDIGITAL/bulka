import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_cubit.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_state.dart';
import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_boolean_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_drop_down_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_multi_select_drop_down_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_phone_widget.dart';
import 'package:bulka/core/services/category_fields/view/widgets/default_category_field_text_widget.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultCategoryFieldsWidget extends StatefulWidget {
  const DefaultCategoryFieldsWidget({
    super.key,
    required this.params,
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
  final CategoryFieldParams params;
  final Function(List<CategoryFieldEntity>? choosenCategoryFields)? onSelected;
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
  State<DefaultCategoryFieldsWidget> createState() =>
      _DefaultCategoryFieldsWidgetState();
}

class _DefaultCategoryFieldsWidgetState
    extends State<DefaultCategoryFieldsWidget> {
  List<CategoryFieldEntity>? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryFieldsCubit(sl())..categoryFieldsStatesHandled(widget.params),
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
                      );
                    case CategoryFieldTypes.dorpdown:
                      return DefaultCategoryFieldDropDownWidget(
                        cubit.categoryFields![index],
                      );
                    case CategoryFieldTypes.integer:
                      return DefaultCategoryFieldIntegerWidget(
                        cubit.categoryFields![index],
                      );
                    case CategoryFieldTypes.boolean:
                      return DefaultCategoryFieldBooleanWidget(
                        cubit.categoryFields![index],
                      );
                    case CategoryFieldTypes.multiselect:
                      return DefaultCategoryFieldMultiSelectWidget(
                        cubit.categoryFields![index],
                      );
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
