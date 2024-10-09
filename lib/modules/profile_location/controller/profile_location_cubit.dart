import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:equatable/equatable.dart';

part 'profile_location_state.dart';

class ProfileLocationCubit extends Cubit<ProfileLocationState> {
  ProfileLocationCubit() : super(ProfileLocationInitial());
  //----------------------------------variables-------------------------------//
  bool isChecked = false;
  //----------------------------------functions-------------------------------//
  void deleteCheckedLocaiton(value) {
    isChecked = value;
    emit(DeleteCheckedLocaiton());
  }

  //----------------------------------requests--------------------------------//
}
