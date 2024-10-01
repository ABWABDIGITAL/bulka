import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/create_ad/data/entity/create_ad_entity.dart';
import 'package:bulka/modules/create_ad/data/model/create_ad_model.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:dartz/dartz.dart';

class CreateAdRepo {
  const CreateAdRepo();

  Future<Either<ApiErrorEntity, CreateAdEntity>> createAd(
      CreateAdParams params) async {
    try {
      final data = await params.returnedMap();
      final response = await DioHelper.post(
        ApiConstance.login,
        data: data,
        isFormData: true,
      );

      return Right(CreateAdModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
