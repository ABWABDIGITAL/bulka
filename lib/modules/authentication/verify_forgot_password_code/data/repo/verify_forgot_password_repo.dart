import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/entity/verify_forgot_password_entity.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/model/verify_forgot_password_model.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/params/verify_forgot_password_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyForgotPasswordRepo extends Equatable {
  const VerifyForgotPasswordRepo();

  Future<Either<ApiErrorEntity, VerifyForgotPasswordEntity>>
      verifyForgotPassword(VerifyForgotPasswordParams params) async {
    try {
      final response = await DioHelper.post(
        params.accountForgotPassword.endPoint,
        data: params.returnedMap(),
      );
      return Right(VerifyForgotPasswordModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
