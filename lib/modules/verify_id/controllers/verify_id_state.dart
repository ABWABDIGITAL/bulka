part of 'verify_id_cubit.dart';

sealed class VerifyIdState extends Equatable {
  const VerifyIdState();

  @override
  List<Object> get props => [];
}

final class VerifyIdInitial extends VerifyIdState {}

final class VerifyIdLoading extends VerifyIdState {}

final class VerifyIdLoaded extends VerifyIdState {
  final String message;
  const VerifyIdLoaded(this.message);

  @override
  List<Object> get props => [message];
}

final class VerifyIdError extends VerifyIdState {
  final ApiErrorEntity error;
  const VerifyIdError(this.error);

  @override
  List<Object> get props => [error];
}

//----------------------------------------update index-------------------------------------------//

final class VerifyIdUpdateIndex extends VerifyIdState {}
