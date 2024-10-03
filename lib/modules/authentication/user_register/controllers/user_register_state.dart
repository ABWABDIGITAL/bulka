import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/services/countries/data/entity/country_entity.dart';
import 'package:bulka/modules/authentication/user_register/data/entity/user_reigster_entity.dart';

sealed class UserRegisterState {
  const UserRegisterState();
}

final class UserRegisterInitial extends UserRegisterState {}

final class ChangePasswordStatus extends UserRegisterState {}

final class ChangeAgreePolicyAndConditions extends UserRegisterState {}

final class UserRegisterLoading extends UserRegisterState {}

final class UserRegisterSuccess extends UserRegisterState {
  UserRegisterSuccess(this.user);
  final UserRegisterEntity user;
}

final class UserRegisterError extends UserRegisterState {
  UserRegisterError(this.error);
  final ApiErrorEntity error;
}
