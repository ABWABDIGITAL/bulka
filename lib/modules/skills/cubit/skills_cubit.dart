import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:bulka/modules/skills/data/repo/skills_repo.dart';
import 'package:equatable/equatable.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  final SkillsRepo _skillsRepo;
  SkillsCubit(this._skillsRepo) : super(SkillsInitial());
  //-----------------------------------------------variables--------------------------------------//
  //-----------------------------------------------functions--------------------------------------//
  //-----------------------------------------------requests---------------------------------------//
  void getSkills() async {
    emit(GetSkillsLoading());
    final response = await _skillsRepo.getSkills();
    response.fold(
      (error) => emit(GetSkillsError(error)),
      (skills) => emit(GetSkillsLoaded(skills)),
    );
  }
}
