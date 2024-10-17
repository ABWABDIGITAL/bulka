import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:bulka/modules/skills/data/params/skills_params.dart';
import 'package:bulka/modules/skills/data/repo/skills_repo.dart';
import 'package:flutter/material.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  final SkillsRepo _skillsRepo;
  SkillsCubit(this._skillsRepo) : super(SkillsInitial());
  //-----------------------------------------------variables--------------------------------------//
  TextEditingController searchController = TextEditingController();
  List<SkillsEntity>? _skills;
  List<SkillsEntity>? _chosenSkills;
  //-----------------------------------------------functions--------------------------------------//
  List<SkillsEntity>? get skills => _skills;
  List<SkillsEntity>? get chosenSkills => _chosenSkills;
  void getSearchedSkills() {
    List<SkillsEntity> searchResult = _skills!
        .where((skill) => skill.name
            .toLowerCase()
            .startsWith(searchController.text.toLowerCase()))
        .toList();
    emit(AddSearchList(searchResult));
  }

  void checkAndToggleInterest(int skillIndex) {
    if (_chosenSkills!.contains(_skills![skillIndex])) {
      log('remove');
      searchController.clear();
      _chosenSkills!.remove(_skills![skillIndex]);
    } else {
      log('add');
      _chosenSkills!.add(_skills![skillIndex]);
      searchController.clear();
    }
    emit(AddChosenSkillsList());
  }

  void removeChosenSkill(int skill) {
    _chosenSkills!.removeAt(skill);
    emit(RemoveChosenSkillsList());
  }

  //-----------------------------------------------requests---------------------------------------//
  void getSkills() async {
    emit(GetSkillsLoading());
    final response = await _skillsRepo.getSkills();
    response.fold(
      (error) => emit(GetSkillsError(error)),
      (skills) {
        _skills = skills;
        emit(GetSkillsLoaded(skills));
      },
    );
  }

  void getUserSkills() async {
    emit(GetUserSkillsLoading());
    final response = await _skillsRepo.getUserSkills();
    response.fold(
      (error) => emit(GetUserSkillsError(error)),
      (skills) {
        _chosenSkills = skills;
        emit(GetUserSkillsLoaded(skills));
      },
    );
  }

  void postSkills() async {
    emit(PostSkillsLoading());
    final params = SkillsParams(skillsIds: _chosenSkills!);
    final response = await _skillsRepo.postSkills(params);
    response.fold(
      (error) => emit(PostSkillsError(error)),
      (skills) {
        emit(PostSkillsLoaded(skills));
      },
    );
  }

  void deleteSkills(int id) async {
    emit(DeleteSkillsLoading());
    
    final response = await _skillsRepo.deleteSkills(id);
    response.fold(
      (error) => emit(DeleteSkillsError(error)),
      (skills) {
        emit(DeleteSkillsLoaded(skills));
      },
    );
  }
}
