import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/user_language/data/entities/all_levels_entity.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';
import 'package:bulka/modules/user_language/data/params/user_language_params.dart';
import 'package:bulka/modules/user_language/data/repo/user_language_repo.dart';
import 'package:flutter/material.dart';

part 'user_language_state.dart';

class UserLanguageCubit extends Cubit<UserLanguageState> {
  final UserLanguageRepo _userLanguageRepo;
  UserLanguageCubit(this._userLanguageRepo) : super(UserLanguageInitial());
//---------------------------------------------variables---------------------------------------------//
  TextEditingController searchController = TextEditingController();
  List<UserLanguageEntity>? _userLanguage;
  List<AllLevelsEntity>? _allLevels;
  UserLanguageEntity? selectedLanguage;
  AllLevelsEntity? selectedLevel;
  int? selectedlangId;
  int? selectedDeleteLangId;
  int? selectedLevelId;
//--------------------------------------------functions--------------------------------------------//
  List<UserLanguageEntity>? get userLanguage => _userLanguage;
  List<AllLevelsEntity>? get allLevels => _allLevels;
  void getSearchedSkills() {
    List<UserLanguageEntity> searchResult = _userLanguage!
        .where(
          (language) => language.language.toLowerCase().startsWith(
                searchController.text.toLowerCase(),
              ),
        )
        .toList();
    emit(AddSearchList(searchResult));
  }

  void setSelectedLanguage(UserLanguageEntity? language) {
    selectedlangId = language!.id;
    selectedLanguage = language;

    emit(SelectedLanguage());
  }

  void setSelectedLevel(AllLevelsEntity? level) {
    selectedLevelId = level!.id;
    selectedLevel = level;

    emit(SelectedLevel());
  }

//-----------------------------------------------requests----------------------------------------------//
  void getUserLanguage() async {
    emit(GetUserLanguageLoading());
    final result = await _userLanguageRepo.getUserLang();
    result.fold(
      (error) => emit(GetUserLanguageError(error)),
      (data) {
        emit(GetUserLanguageLoaded(data));
      },
    );
  }

  void getAllLanguages() async {
    emit(GetAllLanguagesLoading());
    final result = await _userLanguageRepo.getAllLang();
    result.fold(
      (error) => emit(GetAllLanguagesError(error)),
      (data) {
        _userLanguage = data;
        emit(GetAllLanguagesLoaded(data));
      },
    );
  }

  void getAllLevels() async {
    emit(GetAllLevelsLoading());
    final result = await _userLanguageRepo.getAllLevels(selectedlangId!);
    result.fold(
      (error) => emit(GetAllLevelsError(error)),
      (data) {
        _allLevels = data;
        emit(GetAllLevelsLoaded(data));
      },
    );
  }

  void postUserNewLang() async {
    emit(PostUserNewLanguageLoading());
    final params =
        UserLanguageParams(levelId: selectedLevelId!, langId: selectedlangId!);
    final result = await _userLanguageRepo.postUserLanguage(params);
    result.fold(
      (error) => emit(PostUserNewLanguageError(error)),
      (data) {
        emit(
          PostUserNewLanguageLoaded(data),
        );
      },
    );
  }

  void deleteUserLang() async {
    emit(DeleteUserLanguageLoading());
    final result =
        await _userLanguageRepo.deleteUserLanguage(selectedDeleteLangId!);
    result.fold(
      (error) => emit(DeleteUserLanguageError(error)),
      (data) {
        emit(DeleteUserLanguageLoaded(data));
      },
    );
  }
}
