import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/forgot_password/data/entity/forgot_password_entity.dart';
import 'package:bulka/modules/authentication/forgot_password/data/model/forgot_password_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ForgotPasswordRepo extends Equatable {
  const ForgotPasswordRepo();

  Future<Either<ApiErrorEntity, ForgotPasswordEntity>> forgotPasswordCode(
      AccountForgotPassword params) async {
    try {
      final response = await DioHelper.post(
        params.endPoint,
      );
      return Right(ForgotPasswordModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
