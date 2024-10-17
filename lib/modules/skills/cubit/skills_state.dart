part of 'skills_cubit.dart';

sealed class SkillsState extends Equatable {
  const SkillsState();

  @override
  List<Object> get props => [];
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
//--------------------------------post skills--------------------------//

final class PostSkillsLoading extends SkillsState {}

final class PostSkillsError extends SkillsState {
  final ApiErrorEntity error;

  const PostSkillsError(this.error);
}

final class PostSkillsLoaded extends SkillsState {
  final List<SkillsEntity> skills;

  const PostSkillsLoaded(this.skills);
}

final class ChosenSkillsList extends SkillsState{}