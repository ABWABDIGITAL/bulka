part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState {
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ChooseVerifyMethodChanged extends ForgotPasswordState {}
