import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/logout/data/params/logout_params.dart';
import 'package:dartz/dartz.dart';

class LogoutRepo {
  const LogoutRepo();
  Future<Either<ApiErrorEntity, String>> logout(LogoutParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.logout, data: body.toMap());

      return Right(response.data['message']);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
