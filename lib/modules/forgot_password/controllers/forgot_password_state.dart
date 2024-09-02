part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState {
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ChooseVerifyMethodChanged extends ForgotPasswordState {}

final class GetForgotPasswordCodeLoading extends ForgotPasswordState {
  const GetForgotPasswordCodeLoading();
}

final class GetForgotPasswordCodeSuccess extends ForgotPasswordState {
  GetForgotPasswordCodeSuccess(this.forgotPasswordEntity);
  final ForgotPasswordEntity forgotPasswordEntity;
}

final class GetForgotPasswordCodeError extends ForgotPasswordState {
  GetForgotPasswordCodeError(this.error);
  final ApiErrorEntity error;
}
