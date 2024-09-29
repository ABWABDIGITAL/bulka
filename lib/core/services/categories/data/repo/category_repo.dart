import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/services/categories/data/model/category_model.dart';
import 'package:bulka/core/services/categories/data/params/category_params.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CategoryRepo extends Equatable {
  const CategoryRepo();

  Future<Either<ApiErrorEntity, List<CategoryEntity>>> categories(
      {CategoryParams? category}) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.categories,
        queries: category?.returnedMap(),
      );

      final List<CategoryEntity> categories =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => CategoryModel.fromJson(e))
                  .toList()
              : [];

      return Right(categories);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
