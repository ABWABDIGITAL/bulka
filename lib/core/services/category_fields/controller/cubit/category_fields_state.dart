import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class CategoryFieldsState {
  const CategoryFieldsState();
}

final class CategoryFieldsInitial extends CategoryFieldsState {}

final class GetCategoryFieldsLoading extends CategoryFieldsState {
  const GetCategoryFieldsLoading();
}

final class GetCategoryFieldsSuccess extends CategoryFieldsState {
  final List<CategoryFieldEntity> categoryFields;
  const GetCategoryFieldsSuccess(this.categoryFields);
}

final class GetCategoryFieldsError extends CategoryFieldsState {
  GetCategoryFieldsError(this.error);
  final ApiErrorEntity error;
}
