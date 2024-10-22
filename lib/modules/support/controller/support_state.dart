part of 'support_cubit.dart';

sealed class SupportState extends Equatable {
  const SupportState();

  @override
  List<Object> get props => [];
}

final class SupportInitial extends SupportState {}

//-------------------------------------------------send support email---------------------------------------//

final class EmailSupportLoading extends SupportState {}

final class EmailSupportLoaded extends SupportState {
  final String message;

  const EmailSupportLoaded(this.message);

  @override
  List<Object> get props => [message];
}

final class EmailSupportError extends SupportState {
  final ApiErrorEntity error;

  const EmailSupportError(this.error);

  @override
  List<Object> get props => [error];
}
