part of 'logout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}
final class LogoutLoading extends LogoutState {}

final class LogoutLoaded extends LogoutState {
  final String message;
  const LogoutLoaded(this.message);
}

final class LogoutError extends LogoutState {
  final ApiErrorEntity error;

  const LogoutError(this.error);
}

