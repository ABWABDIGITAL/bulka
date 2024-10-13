part of 'education_cubit.dart';

sealed class EducationState {
  const EducationState();

 
}

final class EducationInitial extends EducationState {}

//--------------------------------Remove Education--------------------------//
final class RemoveEducationLoading extends EducationState {}

final class RemoveEducationError extends EducationState {
  final ApiErrorEntity error;

  const RemoveEducationError(this.error);
}

final class RemoveEducationLoaded extends EducationState {}

//--------------------------------Work Experience current position--------------------------//

final class EducationCurrentPosition extends EducationState {}

//--------------------------------get education degree--------------------------//

final class GetEducationDegreeLoading extends EducationState {}

final class GetEducationDegreeError extends EducationState {
  final ApiErrorEntity error;

  const GetEducationDegreeError(this.error);
}

final class GetEducationDegreeLoaded extends EducationState {
  final List<EducationDegreeEntity> educationDegree;

  const GetEducationDegreeLoaded(this.educationDegree);
}
//--------------------------------get education university--------------------------//

final class GetEducationUniversityLoading extends EducationState {}

final class GetEducationUniversityError extends EducationState {
  final ApiErrorEntity error;

  const GetEducationUniversityError(this.error);
}

final class GetEducationUniversityLoaded extends EducationState {
  final List<EducationUniversityEntity> educationUniversity;

  const GetEducationUniversityLoaded(this.educationUniversity);
}

//--------------------------------Post Education--------------------------//

final class PostEducationLoading extends EducationState {}

final class PostEducationError extends EducationState {
  final ApiErrorEntity error;

  const PostEducationError(this.error);
}

final class PostEducationLoaded extends EducationState {
  final String message;

  const PostEducationLoaded(this.message);
}
//--------------------------------get Work Experiences--------------------------//

final class GetEducationLoading extends EducationState {}

final class GetEducationError extends EducationState {
  final ApiErrorEntity error;

  const GetEducationError(this.error);
}

final class GetEducationLoaded extends EducationState {
  final List<EducationEntity> education;

  const GetEducationLoaded(this.education);
}



