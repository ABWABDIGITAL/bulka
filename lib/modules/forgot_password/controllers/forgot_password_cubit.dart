import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;
  ForgotPasswordCubit(this._forgotPasswordRepo)
      : super(ForgotPasswordInitial());
//---------------------------------VARIABLES----------------------------------//
  VerifyAccountMethod _verifyAccountMethod = VerifyAccountMethod.email;

//---------------------------------FUNCTIONS----------------------------------//
  VerifyAccountMethod get verifyAccountMethod => _verifyAccountMethod;

  void setVerifyAccountMethod(VerifyAccountMethod method) {
    _verifyAccountMethod = method;
    emit(ChooseVerifyMethodChanged());
  }

//---------------------------------REQUEST----------------------------------//
}
