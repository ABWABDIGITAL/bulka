import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class CategoryState {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

final class GetCategoriesLoading extends CategoryState {
  const GetCategoriesLoading();
}

final class GetCategoriesSuccess extends CategoryState {
  final List<CategoryEntity> categories;
  const GetCategoriesSuccess(this.categories);
}

final class GetCategoriesError extends CategoryState {
  final ApiErrorEntity error;
  const GetCategoriesError(this.error);
}
