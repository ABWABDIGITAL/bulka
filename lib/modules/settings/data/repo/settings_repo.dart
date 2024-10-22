import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:dartz/dartz.dart';

class SettingsRepo {
  const SettingsRepo();

  Future<Either<ApiErrorEntity, String>> toggleNotification() async {
    try {
      final respose = await DioHelper.post(ApiConstance.notificationToggle);
      // Add your logic here
      return Right(respose.data['message']);
    } catch (e) {
      return Left(
        ErrorHandler.handleError(e),
      );
    }
  }
}
