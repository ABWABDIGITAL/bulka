import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/verify_phone/data/entity/resend_verify_phone_entity.dart';
import 'package:bulka/modules/authentication/verify_phone/data/entity/verify_phone_entity.dart';
import 'package:bulka/modules/authentication/verify_phone/data/model/resend_verify_phone_model.dart';
import 'package:bulka/modules/authentication/verify_phone/data/model/verify_phone_model.dart';
import 'package:bulka/modules/authentication/verify_phone/data/params/verify_phone_params.dart';
import 'package:bulka/modules/authentication/verify_phone/data/params/verify_resend_phone_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyPhoneRepo extends Equatable {
  const VerifyPhoneRepo();

  Future<Either<ApiErrorEntity, VerifyPhoneEntity>> verifyWithPhone(
      VerifyPhoneParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.verifyWithPhone,
        data: params.returnedMap(),
      );
      return Right(VerifyPhoneModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, ResendVerifyPhoneEntity>> resendVerifyWithPhone(
      VerifyResendPhoneParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.resendVerifyWithPhone,
        data: params.returnedMap(),
      );
      return Right(ResendVerifyPhoneModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
