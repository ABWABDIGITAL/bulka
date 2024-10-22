part of 'about_us_cubit.dart';

sealed class AboutUsState extends Equatable {
  const AboutUsState();

  @override
  List<Object> get props => [];
}

final class AboutUsInitial extends AboutUsState {}
//------------------- social media links -------------------//

final class AboutUsLoading extends AboutUsState {}

final class AboutUsLoaded extends AboutUsState {
  final List<AboutUsEntity> aboutUsEntity;

  const AboutUsLoaded(this.aboutUsEntity);

  @override
  List<Object> get props => [aboutUsEntity];
}

final class AboutUsError extends AboutUsState {
  final ApiErrorEntity error;

  const AboutUsError(this.error);

  @override
  List<Object> get props => [error];
}
//------------------- social media links -------------------//

final class TermsLoading extends AboutUsState {}

final class TermsLoaded extends AboutUsState {
  final List<TermsEntity> termsEntity;

  const TermsLoaded(this.termsEntity);

  @override
  List<Object> get props => [termsEntity];
}

final class TermsError extends AboutUsState {
  final ApiErrorEntity error;

  const TermsError(this.error);

  @override
  List<Object> get props => [error];
}
