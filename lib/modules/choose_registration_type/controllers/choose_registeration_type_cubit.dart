import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/choose_registration_type/controllers/choose_registeration_type_state.dart';

class ChooseRegisterationTypeCubit extends Cubit<ChooseRegisterationTypeState> {
  ChooseRegisterationTypeCubit() : super(ChooseRegisterationTypeInitial());
//---------------------------------VARIABLES----------------------------------//
  UserRole _userRole = UserRole.user;
//---------------------------------FUNCTIONS----------------------------------//
  UserRole get userRole => _userRole;
  void changeUserRole(UserRole userRole) {
    _userRole = userRole;
    emit(ChangeUserRoleStatus());
  }
//----------------------------------REQUEST-----------------------------------//
}
