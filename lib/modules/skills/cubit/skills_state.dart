part of 'skills_cubit.dart';

sealed class SkillsState {
  const SkillsState();
}

final class SkillsInitial extends SkillsState {}
//--------------------------------get skills--------------------------//

final class GetSkillsLoading extends SkillsState {}

final class GetSkillsError extends SkillsState {
  final ApiErrorEntity error;

  const GetSkillsError(this.error);
}

final class GetSkillsLoaded extends SkillsState {
  final List<SkillsEntity> skills;

  const GetSkillsLoaded(this.skills);
}
//--------------------------------get user skills--------------------------//

final class GetUserSkillsLoading extends SkillsState {}

final class GetUserSkillsError extends SkillsState {
  final ApiErrorEntity error;

  const GetUserSkillsError(this.error);
}

final class GetUserSkillsLoaded extends SkillsState {
  final List<SkillsEntity> skills;

  const GetUserSkillsLoaded(this.skills);
}
//--------------------------------post skills--------------------------//

final class PostSkillsLoading extends SkillsState {}

final class PostSkillsError extends SkillsState {
  final ApiErrorEntity error;

  const PostSkillsError(this.error);
}

final class PostSkillsLoaded extends SkillsState {
  final String message;

  const PostSkillsLoaded(this.message);
}

//--------------------------------post skills--------------------------//

final class DeleteSkillsLoading extends SkillsState {}

final class DeleteSkillsError extends SkillsState {
  final ApiErrorEntity error;

  const DeleteSkillsError(this.error);
}

final class DeleteSkillsLoaded extends SkillsState {
  final String message;

  const DeleteSkillsLoaded(this.message);
}
//----------------------------------------------------------//
final class AddChosenSkillsList extends SkillsState {}

final class RemoveChosenSkillsList extends SkillsState {}

final class AddSearchList extends SkillsState {
  final List<SkillsEntity> skills;

  const AddSearchList(this.skills);
}
