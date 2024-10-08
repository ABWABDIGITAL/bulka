part of 'edit_profile_cubit.dart';

sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

final class EditProfileInitial extends EditProfileState {}
final class EditProfileLoading extends EditProfileState {}

final class EditProfileLoaded extends EditProfileState {
  final String message;
  const EditProfileLoaded(this.message);
}

final class EditProfileError extends EditProfileState {
  final ApiErrorEntity error;

  const EditProfileError(this.error);
}
