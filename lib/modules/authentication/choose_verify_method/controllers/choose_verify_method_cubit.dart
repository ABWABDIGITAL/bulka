import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/authentication/choose_verify_method/controllers/choose_verify_method_state.dart';

class ChooseVerifyMethodCubit extends Cubit<ChooseVerifyMethodState> {
  ChooseVerifyMethodCubit() : super(ChooseVerifyMethodInitial());
//---------------------------------VARIABLES----------------------------------//
  VerifyAccountMethod _verifyAccountMethod = VerifyAccountMethod.email;
//---------------------------------FUNCTIONS----------------------------------//
  VerifyAccountMethod get verifyAccountMethod => _verifyAccountMethod;
  void setVerifyAccountMethod(VerifyAccountMethod method) {
    _verifyAccountMethod = method;
    emit(ChooseVerifyMethodChanged());
  }
//----------------------------------REQUEST-----------------------------------//
}
