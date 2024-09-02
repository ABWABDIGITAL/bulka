import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/user_register/data/entity/user_reigster_entity.dart';
import 'package:bulka/modules/user_register/data/model/user_register_model.dart';
import 'package:bulka/modules/user_register/data/params/user_register_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UserRegisterRepo extends Equatable {
  const UserRegisterRepo();

  Future<Either<ApiErrorEntity, UserRegisterEntity>> register(
      UserRegisterParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.userRegister,
        data: params.returnedMap(),
      );
      return Right(UserRegisterModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
