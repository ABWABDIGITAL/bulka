part of 'profile_location_cubit.dart';

sealed class ProfileLocationState  {
  const ProfileLocationState();


}

final class ProfileLocationInitial extends ProfileLocationState {}

final class ProfileLocationLoading extends ProfileLocationState {}

final class ProfileLocationLoaded extends ProfileLocationState {
  //final List<Location> locations;

  const ProfileLocationLoaded(/* this.locations */);

  @override
  List<Object> get props => [/* locations */];
}

final class ProfileLocationError extends ProfileLocationState {
  final ApiErrorEntity error;

  const ProfileLocationError(this.error);

  @override
  List<Object> get props => [error];
}

final class DeleteCheckedLocaiton extends ProfileLocationState {}
