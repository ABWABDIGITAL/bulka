import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:dartz/dartz.dart';

class LogoutRepo {
  const LogoutRepo();
  Future<Either<ApiErrorEntity, String>> logout() async {
    try {
      final response = await DioHelper.post(ApiConstance.logout);

      return Right(response.data['message']);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
