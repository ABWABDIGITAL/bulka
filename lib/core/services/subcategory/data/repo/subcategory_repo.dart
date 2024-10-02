import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/services/subcategory/data/entity/subcategory_entity.dart';
import 'package:bulka/core/services/subcategory/data/model/subcategory_model.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SubcategoryRepo extends Equatable {
  const SubcategoryRepo();

  Future<Either<ApiErrorEntity, List<SubcategoryEntity>>> subcategory(
      SubcategoryParams params) async {
    try {
      final response = await DioHelper.get(ApiConstance.subcategory(params));

      final List<SubcategoryEntity> subcategories =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => SubcategoryModel.fromJson(e))
                  .toList()
              : [];

      return Right(subcategories);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
