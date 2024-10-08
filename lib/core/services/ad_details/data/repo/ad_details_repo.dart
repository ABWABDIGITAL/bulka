import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';
import 'package:bulka/core/services/ad_details/data/model/ad_details_model.dart';
import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:dartz/dartz.dart';

class AdDetailsRepo {
  const AdDetailsRepo();

  Future<Either<ApiErrorEntity, AdDetailsEntity>> adDetails(
      AdDetailsParams params) async {
    try {
      final response = await DioHelper.get(ApiConstance.adDetails(params));

      return Right(AdDetailsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
