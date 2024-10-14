import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsErrorStateWidget extends StatelessWidget {
  const CategoryProductsErrorStateWidget({
    super.key,
    required this.error,
  });
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryProductsCubit>();

    return cubit.categoryProductsEntity == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              cubit.categoryProductsStatesHandled();
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              cubit.categoryProductsStatesHandled();
            },
          );
  }
}
