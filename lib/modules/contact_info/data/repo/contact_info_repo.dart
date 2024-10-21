import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/contact_info/data/params/contact_info_verify_email_params.dart';
import 'package:bulka/modules/contact_info/data/params/contact_info_verify_phone_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ContactInfoRepo extends Equatable {
  const ContactInfoRepo();
  Future<Either<ApiErrorEntity, String>> postVerifyPhone(
      ContactInfoVerifyPhoneParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.updatePhoneApprove, data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }
   Future<Either<ApiErrorEntity, String>> postUpdatePhone(
      ContactInfoVerifyPhoneParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.updatePhone, data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }
   Future<Either<ApiErrorEntity, String>> postVerifyEmail(
      ContactInfoVerifyEmailParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.updateEmailApprove, data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }
   Future<Either<ApiErrorEntity, String>> postUpdateEmail(
      ContactInfoVerifyEmailParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.updateEmail, data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
