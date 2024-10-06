import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/services/category_fields/data/model/category_field_model.dart';
import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:dartz/dartz.dart';

class CategoryFieldRepo {
  const CategoryFieldRepo();

  Future<Either<ApiErrorEntity, List<CategoryFieldEntity>>> categoryFields(
      CategoryFieldParams params) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.categoryFields,
        queries: params.returnedMap(),
      );

      final List<CategoryFieldEntity> categoryFields =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => CategoryFieldModel.fromJson(e))
                  .toList()
              : [];

      return Right(categoryFields);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
