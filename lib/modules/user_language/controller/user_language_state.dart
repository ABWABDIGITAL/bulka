part of 'user_language_cubit.dart';

sealed class UserLanguageState {
  const UserLanguageState();
}

final class UserLanguageInitial extends UserLanguageState {}
//-------------------------------------------get user language--------------------------------------//

final class GetUserLanguageLoading extends UserLanguageState {}

final class GetUserLanguageLoaded extends UserLanguageState {
  final List<UserLanguageEntity> userLanguage;

  const GetUserLanguageLoaded(this.userLanguage);
}

final class GetUserLanguageError extends UserLanguageState {
  final ApiErrorEntity error;

  const GetUserLanguageError(this.error);
}
//-------------------------------------------get All languages--------------------------------------//

final class GetAllLanguagesLoading extends UserLanguageState {}

final class GetAllLanguagesLoaded extends UserLanguageState {
  final List<UserLanguageEntity> userLanguage;

  const GetAllLanguagesLoaded(this.userLanguage);
}

final class GetAllLanguagesError extends UserLanguageState {
  final ApiErrorEntity error;

  const GetAllLanguagesError(this.error);
}
//-------------------------------------------get All languages--------------------------------------//

final class GetAllLevelsLoading extends UserLanguageState {}

final class GetAllLevelsLoaded extends UserLanguageState {
  final List<AllLevelsEntity> levels;

  const GetAllLevelsLoaded(this.levels);
}

final class GetAllLevelsError extends UserLanguageState {
  final ApiErrorEntity error;

  const GetAllLevelsError(this.error);
}
//-------------------------------------------post user new lang--------------------------------------//

final class PostUserNewLanguageLoading extends UserLanguageState {}

final class PostUserNewLanguageLoaded extends UserLanguageState {
  final String message;

  const PostUserNewLanguageLoaded(this.message);
}

final class PostUserNewLanguageError extends UserLanguageState {
  final ApiErrorEntity error;

  const PostUserNewLanguageError(this.error);
}

//-------------------------------------------delete user  lang--------------------------------------//

final class DeleteUserLanguageLoading extends UserLanguageState {}

final class DeleteUserLanguageLoaded extends UserLanguageState {
  final String message;

  const DeleteUserLanguageLoaded(this.message);
}

final class DeleteUserLanguageError extends UserLanguageState {
  final ApiErrorEntity error;

  const DeleteUserLanguageError(this.error);
}
//-------------------------------------------search languages--------------------------------------//

final class AddSearchList extends UserLanguageState {
  final List<UserLanguageEntity> searchList;

  const AddSearchList(this.searchList);
}

//-------------------------------------------select language--------------------------------------//

final class SelectedLanguage extends UserLanguageState {}

//-------------------------------------------select level--------------------------------------//

final class SelectedLevel extends UserLanguageState {}
