import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/category_products/data/entity/category_products_entity.dart';

sealed class CategoryProductsState {
  const CategoryProductsState();
}

final class CategoryProductsInitial extends CategoryProductsState {}

final class CategoryProductsLoading extends CategoryProductsState {
  const CategoryProductsLoading();
}

final class CategoryProductsSuccess extends CategoryProductsState {
  final CategoryProductsEntity categoryProducts;
  const CategoryProductsSuccess(this.categoryProducts);
}

final class CategoryProductsError extends CategoryProductsState {
  final ApiErrorEntity error;
  const CategoryProductsError(this.error);
}

final class ChangeDisplay extends CategoryProductsState {}
