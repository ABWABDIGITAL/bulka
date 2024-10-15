import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/profile_change_password/data/params/profile_change_password.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ProfileChangePasswordRepo extends Equatable {
  const ProfileChangePasswordRepo();

  Future<Either<ApiErrorEntity, String>> changePassword(ProfileChangePasswordParams body) async {
    try {
      final response = await DioHelper.post(ApiConstance.changePassword,data: body.toMap());
      return Right(response.data['message']);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
