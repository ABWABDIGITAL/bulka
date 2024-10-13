part of 'work_experience_cubit.dart';

sealed class WorkExperienceState {
  const WorkExperienceState();

 
}

final class WorkExperienceInitial extends WorkExperienceState {}

//--------------------------------remove work experience--------------------------//

final class RemoveWorkExperienceLoading extends WorkExperienceState {}

final class RemoveWorkExperienceError extends WorkExperienceState {
  final ApiErrorEntity error;

  const RemoveWorkExperienceError(this.error);
}

final class RemoveWorkExperienceLoaded extends WorkExperienceState {}

//--------------------------------get job titles--------------------------//

final class GetJobTitlesLoading extends WorkExperienceState {}

final class GetJobTitlesError extends WorkExperienceState {
  final ApiErrorEntity error;

  const GetJobTitlesError(this.error);
}

final class GetJobTitlesLoaded extends WorkExperienceState {
  final List<JobTitlesEntity> jobTitles;

  const GetJobTitlesLoaded(this.jobTitles);
}

//--------------------------------get Work Experiences--------------------------//

final class GetWorkExperienceLoading extends WorkExperienceState {}

final class GetWorkExperienceError extends WorkExperienceState {
  final ApiErrorEntity error;

  const GetWorkExperienceError(this.error);
}

final class GetWorkExperienceLoaded extends WorkExperienceState {
  final List<WorkExperienceEntity> workExperience;

  const GetWorkExperienceLoaded(this.workExperience);
}
//--------------------------------Post Work Experience--------------------------//

final class PostWorkExperienceLoading extends WorkExperienceState {}

final class PostWorkExperienceError extends WorkExperienceState {
  final ApiErrorEntity error;

  const PostWorkExperienceError(this.error);
}

final class PostWorkExperienceLoaded extends WorkExperienceState {
  final String message;

  const PostWorkExperienceLoaded(this.message);
}

//--------------------------------Work Experience current position--------------------------//

final class WorkExperienceCurrentPosition extends WorkExperienceState {}