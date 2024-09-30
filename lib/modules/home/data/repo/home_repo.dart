import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/home/data/entity/home_entity.dart';
import 'package:bulka/modules/home/data/model/home_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  const HomeRepo();

  Future<Either<ApiErrorEntity, HomeEntity>> home() async {
    try {
      final response = await DioHelper.get(ApiConstance.home);
      return Right(HomeModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
