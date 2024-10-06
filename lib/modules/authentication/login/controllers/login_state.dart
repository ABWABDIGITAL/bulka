import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/authentication/login/data/entity/login_entity.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class ChangePasswordStatus extends LoginState {}

final class ChangeRememberMeStatus extends LoginState {}

final class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

final class LoginStateSuccess extends LoginState {
  LoginStateSuccess(this.loginEntity);
  final LoginEntity loginEntity;
}

final class LoginStateError extends LoginState {
  LoginStateError(this.error);
  final ApiErrorEntity error;
}
