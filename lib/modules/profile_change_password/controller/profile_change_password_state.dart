part of 'profile_change_password_cubit.dart';

sealed class ProfileChangePasswordState extends Equatable {
  const ProfileChangePasswordState();

  @override
  List<Object> get props => [];
}

final class ProfileChangePasswordInitial extends ProfileChangePasswordState {}

final class ProfileChangePasswordLoading extends ProfileChangePasswordState {}

final class ProfileChangePasswordLoaded extends ProfileChangePasswordState {
  final String message;

  const ProfileChangePasswordLoaded(this.message);

  @override
  List<Object> get props => [message];
}

final class ProfileChangePasswordError extends ProfileChangePasswordState {
  final ApiErrorEntity error;

  const ProfileChangePasswordError(this.error);

  @override
  List<Object> get props => [error];
}

final class ProfileOldPasswordStatus extends ProfileChangePasswordState {}

final class ProfileNewPasswordStatus extends ProfileChangePasswordState {}

final class ProfileConfirmNewPasswordStatus extends ProfileChangePasswordState {}
