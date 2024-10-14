import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/category_products/data/entity/category_products_entity.dart';
import 'package:bulka/modules/category_products/data/model/category_products_model.dart';
import 'package:bulka/modules/category_products/data/params/category_products_params.dart';
import 'package:dartz/dartz.dart';

class CategoryProductsRepo {
  const CategoryProductsRepo();

  Future<Either<ApiErrorEntity, CategoryProductsEntity>> categoryProducts(
      CategoryProductsParams params) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.categoriesProducts,
        queries: params.returnedMap(),
      );

      return Right(CategoryProductsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
