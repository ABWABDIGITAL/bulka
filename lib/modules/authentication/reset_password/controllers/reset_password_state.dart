import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/authentication/reset_password/data/entity/reset_password_entity.dart';

sealed class ResetPasswordState {
  const ResetPasswordState();
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ChangePasswordStatus extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  ResetPasswordSuccess(this.entity);
  final ResetPasswordEntity entity;
}

final class ResetPasswordError extends ResetPasswordState {
  ResetPasswordError(this.error);
  final ApiErrorEntity error;
}
