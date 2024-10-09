part of 'work_experience_cubit.dart';

sealed class WorkExperienceState {
  const WorkExperienceState();

 
}

final class WorkExperienceInitial extends WorkExperienceState {}

final class RemoveWorkExperienceLoading extends WorkExperienceState {}

final class RemoveWorkExperienceError extends WorkExperienceState {
  final ApiErrorEntity error;

  const RemoveWorkExperienceError(this.error);
}

final class RemoveWorkExperienceLoaded extends WorkExperienceState {}

final class WorkExperienceCurrentPosition extends WorkExperienceState {}