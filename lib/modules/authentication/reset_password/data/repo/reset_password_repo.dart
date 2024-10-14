import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/reset_password/data/entity/reset_password_entity.dart';
import 'package:bulka/modules/authentication/reset_password/data/model/reset_password_model.dart';
import 'package:bulka/modules/authentication/reset_password/data/params/reset_password_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ResetPasswordRepo extends Equatable {
  const ResetPasswordRepo();

  Future<Either<ApiErrorEntity, ResetPasswordEntity>> resetPassword(
      ResetPasswordParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.resetPassword,
        data: params.returnedMap(),
      );
      return Right(ResetPasswordModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
