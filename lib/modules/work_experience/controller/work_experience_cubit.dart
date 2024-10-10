import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

part 'work_experience_state.dart';

class WorkExperienceCubit extends Cubit<WorkExperienceState> {
  WorkExperienceCubit() : super(WorkExperienceInitial());
  //------------------------------------------variables----------------------------------------//
  bool isCurrentPosition = false;
  //------------------------------------------functions----------------------------------------//
  void onCurrentPosition(bool value) {
    isCurrentPosition = value;
    emit(WorkExperienceCurrentPosition());
  }
  //------------------------------------------requests----------------------------------------//
}
