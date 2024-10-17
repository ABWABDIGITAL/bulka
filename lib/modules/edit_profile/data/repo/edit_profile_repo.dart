import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/edit_profile/data/params/edit_profile_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class EditProfileRepo {
  const EditProfileRepo();
  Future<Either<ApiErrorEntity, Unit>> editProfile(
      EditProfileParams body) async {
    try {
      final params = FormData.fromMap(body.toMap());
      final response = await DioHelper.postFormData(
        ApiConstance.profile,
        data: params,
      );

      return const Right(unit);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
