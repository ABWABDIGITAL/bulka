import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/see_all_ad/data/entity/see_all_entity.dart';
import 'package:bulka/modules/see_all_ad/data/model/see_all_model.dart';
import 'package:bulka/modules/see_all_ad/data/params/see_all_params.dart';
import 'package:dartz/dartz.dart';

class SeeAllAdRepo {
  const SeeAllAdRepo();

  Future<Either<ApiErrorEntity, SeeAllEntity>> seeAll(
      SeeAllParams params) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.seeAllAds,
        queries: params.returnedMap(),
      );

      return Right(SeeAllModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
