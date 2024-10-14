import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/login/data/entity/login_entity.dart';
import 'package:bulka/modules/authentication/login/data/model/login_model.dart';
import 'package:bulka/modules/authentication/login/data/params/login_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginRepo extends Equatable {
  const LoginRepo();

  Future<Either<ApiErrorEntity, LoginEntity>> login(LoginParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.login,
        data: params.returnedMap(),
      );

      return Right(LoginModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
