part of 'edit_profile_cubit.dart';

sealed class EditProfileState   {
  const EditProfileState();


}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileLoaded extends EditProfileState {
  const EditProfileLoaded();
}

final class EditProfileError extends EditProfileState {
  final ApiErrorEntity error;

  const EditProfileError(this.error);
}
