import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/services/sub_subcategory/data/entity/sub_subcategory_entity.dart';
import 'package:bulka/core/services/sub_subcategory/data/model/sub_subcategory_model.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SubSubcategoryRepo extends Equatable {
  const SubSubcategoryRepo();

  Future<Either<ApiErrorEntity, List<SubSubcategoryEntity>>> subSubcategory(
      SubSubcategoryParams params) async {
    try {
      final response = await DioHelper.get(ApiConstance.subSubcategory(params));

      final List<SubSubcategoryEntity> subSubcategories =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => SubSubcategoryModel.fromJson(e))
                  .toList()
              : [];

      return Right(subSubcategories);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
