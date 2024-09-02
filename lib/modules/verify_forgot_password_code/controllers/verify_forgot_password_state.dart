import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/verify_forgot_password_code/data/entity/verify_forgot_password_entity.dart';

sealed class VerifyForgotPasswordState {
  const VerifyForgotPasswordState();
}

final class VerifyForgotPasswordInitial extends VerifyForgotPasswordState {}

final class VerifyAccountOtpFilled extends VerifyForgotPasswordState {}

final class VerifyForgotPasswordLoading extends VerifyForgotPasswordState {
  const VerifyForgotPasswordLoading();
}

final class VerifyForgotPasswordSuccess extends VerifyForgotPasswordState {
  VerifyForgotPasswordSuccess(this.entity);
  final VerifyForgotPasswordEntity entity;
}

final class VerifyForgotPasswordError extends VerifyForgotPasswordState {
  VerifyForgotPasswordError(this.error);
  final ApiErrorEntity error;
}
