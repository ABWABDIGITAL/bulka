part of 'education_cubit.dart';

sealed class EducationState {
  const EducationState();

 
}

final class EducationInitial extends EducationState {}

final class RemoveEducationLoading extends EducationState {}

final class RemoveEducationError extends EducationState {
  final ApiErrorEntity error;

  const RemoveEducationError(this.error);
}

final class RemoveEducationLoaded extends EducationState {}

final class EducationCurrentPosition extends EducationState {}