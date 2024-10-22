part of 'profile_change_password_cubit.dart';

sealed class ProfileChangePasswordState  {
  const ProfileChangePasswordState();

 
}

final class ProfileChangePasswordInitial extends ProfileChangePasswordState {}

final class ProfileChangePasswordLoading extends ProfileChangePasswordState {}

final class ProfileChangePasswordLoaded extends ProfileChangePasswordState {
  final String message;

  const ProfileChangePasswordLoaded(this.message);

  
}

final class ProfileChangePasswordError extends ProfileChangePasswordState {
  final ApiErrorEntity error;

  const ProfileChangePasswordError(this.error);


}

final class ProfileOldPasswordStatus extends ProfileChangePasswordState {}

final class ProfileNewPasswordStatus extends ProfileChangePasswordState {}

final class ProfileConfirmNewPasswordStatus extends ProfileChangePasswordState {}
