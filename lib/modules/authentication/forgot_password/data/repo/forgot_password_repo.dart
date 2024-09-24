import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/abstractions/account_forgot_password.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/forgot_password/data/entity/forgot_password_entity.dart';
import 'package:bulka/modules/authentication/forgot_password/data/model/forgot_password_model.dart';
import 'package:bulka/modules/authentication/forgot_password/data/params/forgot_password_with_email_params.dart';
import 'package:bulka/modules/authentication/forgot_password/data/params/forgot_password_with_phone_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ForgotPasswordRepo extends Equatable {
  const ForgotPasswordRepo();

  Future<Either<ApiErrorEntity, ForgotPasswordEntity>> forgotPasswordViaPhone(
      ForgotPasswordWithPhoneParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.resendVerifyWithPhone,
        data: params.returnedMap(),
      );
      return Right(ForgotPasswordModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, ForgotPasswordEntity>> forgotPasswordViaEmail(
      ForgotPasswordWithEmailParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.forgotPasswordWithEmail,
        data: params.returnedMap(),
      );
      return Right(ForgotPasswordModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
