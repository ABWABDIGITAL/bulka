part of 'certification_cubit.dart';

sealed class CertificationState extends Equatable {
  const CertificationState();

  @override
  List<Object> get props => [];
}

final class CertificationInitial extends CertificationState {}
//--------------------------------Post Certification--------------------------//

final class PostCertificationLoading extends CertificationState {}

final class PostCertificationError extends CertificationState {
  final ApiErrorEntity error;

  const PostCertificationError(this.error);
}

final class PostCertificationLoaded extends CertificationState {
  final String message;

  const PostCertificationLoaded(this.message);
}
