import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:bulka/modules/skills/data/repo/skills_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  final SkillsRepo _skillsRepo;
  SkillsCubit(this._skillsRepo) : super(SkillsInitial());
  //-----------------------------------------------variables--------------------------------------//
  TextEditingController searchController = TextEditingController();
  List<SkillsEntity> skills = [];
  List<SkillsEntity> chosenSkills=[];
  //-----------------------------------------------functions--------------------------------------//
   void getSearchedSkills(
    String searchedSkill,
  ) {
    List<SkillsEntity> searchResult = skills
        .where((skill) =>
            skill.name.toLowerCase().startsWith(searchedSkill))
        .toList();
    emit(GetSkillsLoaded(searchResult));
  }

  
  void checkAndToggleInterest(SkillsEntity interest) {
    if (chosenSkills.contains(interest)) {
      chosenSkills.remove(interest);
    } else {
      chosenSkills.add(interest);
    }
    emit(ChosenSkillsList());
  }

  
  //-----------------------------------------------requests---------------------------------------//
  void getSkills() async {
    emit(GetSkillsLoading());
    final response = await _skillsRepo.getSkills();
    response.fold(
      (error) => emit(GetSkillsError(error)),
      (skills) {
        this.skills = skills;
        emit(GetSkillsLoaded(skills));
      },
    );
  }
 
  /* void postSkills() async {
    emit(PostSkillsLoading());
    final params = chosenSkills.map((skill) => {''}).toList();
    final response = await _skillsRepo.postSkills(chosenSkills);
    response.fold(
      (error) => emit(PostSkillsError(error)),
      (skills) {
        this.skills = skills;
        emit(PostSkillsLoaded(skills));
      },
    );
  } */
}
