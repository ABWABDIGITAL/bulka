import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/authentication/forgot_password/data/entity/forgot_password_entity.dart';
import 'package:bulka/modules/authentication/forgot_password/data/params/forgot_password_with_phone_params.dart';
import 'package:bulka/modules/authentication/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:flutter/material.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;
  ForgotPasswordCubit(this._forgotPasswordRepo)
      : super(ForgotPasswordInitial());
//---------------------------------VARIABLES----------------------------------//
  VerifyAccountMethod _verifyAccountMethod = VerifyAccountMethod.email;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  final GlobalKey<FormState> forgotKey = GlobalKey<FormState>();
//---------------------------------FUNCTIONS----------------------------------//
  VerifyAccountMethod get verifyAccountMethod => _verifyAccountMethod;

  void setVerifyAccountMethod(VerifyAccountMethod method) {
    _verifyAccountMethod = method;
    emit(ChooseVerifyMethodChanged());
  }

//---------------------------------REQUEST----------------------------------//
  Future<void> forgotPasswordViaPhoneStatesHandled() async {
    emit(const GetForgotPasswordCodeLoading());
    final response = await _forgotPasswordRepo.forgotPasswordViaPhone(
      ForgotPasswordWithPhoneParams(
        phone: phoneController.text,
        phoneCode: phoneCodeController.text,
      ),
    );
    response.fold((failure) {
      return emit(GetForgotPasswordCodeError(failure));
    }, (success) async {
      return emit(GetForgotPasswordCodeSuccess(success));
    });
  }
}
