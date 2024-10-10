import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());
  //------------------------------------------variables----------------------------------------//
  bool isCurrentPosition = false;
  //------------------------------------------functions----------------------------------------//
  void onCurrentPosition(bool value) {
    isCurrentPosition = value;
    emit(EducationCurrentPosition());
  }
  //------------------------------------------requests----------------------------------------//
}
