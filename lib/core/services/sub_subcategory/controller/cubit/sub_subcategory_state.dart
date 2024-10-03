import 'package:bulka/core/services/sub_subcategory/data/entity/sub_subcategory_entity.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class SubSubcategoryState {
  const SubSubcategoryState();
}

final class SubSubcategoryInitial extends SubSubcategoryState {}

final class GetSubSubcategoryLoading extends SubSubcategoryState {
  const GetSubSubcategoryLoading();
}

final class GetSubSubcategorySuccess extends SubSubcategoryState {
  final List<SubSubcategoryEntity> subcategories;
  const GetSubSubcategorySuccess(this.subcategories);
}

final class GetSubSubcategoryError extends SubSubcategoryState {
  final ApiErrorEntity error;
  const GetSubSubcategoryError(this.error);
}
