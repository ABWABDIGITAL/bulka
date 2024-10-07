part of 'faq_cubit.dart';

sealed class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object> get props => [];
}

final class FaqInitial extends FaqState {}

final class FaqLoading extends FaqState {}

final class FaqLoaded extends FaqState {
  final List<FaqEntity> faqs;

  const FaqLoaded(this.faqs);

  @override
  List<Object> get props => [faqs];
}

final class FaqError extends FaqState {
  final ApiErrorEntity error;

  const FaqError(this.error);

  @override
  List<Object> get props => [error];
}
