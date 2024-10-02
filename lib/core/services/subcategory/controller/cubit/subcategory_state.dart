import 'package:bulka/core/services/subcategory/data/entity/subcategory_entity.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class SubcategoryState {
  const SubcategoryState();
}

final class SubcategoryInitial extends SubcategoryState {}

final class GetSubcategoryLoading extends SubcategoryState {
  const GetSubcategoryLoading();
}

final class GetSubcategorySuccess extends SubcategoryState {
  final List<SubcategoryEntity> subcategories;
  const GetSubcategorySuccess(this.subcategories);
}

final class GetSubcategoryError extends SubcategoryState {
  final ApiErrorEntity error;
  const GetSubcategoryError(this.error);
}
