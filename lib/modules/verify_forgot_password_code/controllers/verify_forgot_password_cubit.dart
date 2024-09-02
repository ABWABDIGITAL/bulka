import 'package:bloc/bloc.dart';
import 'package:bulka/modules/verify_forgot_password_code/controllers/verify_forgot_password_state.dart';
import 'package:bulka/modules/verify_forgot_password_code/data/params/verify_forgot_password_params.dart';
import 'package:bulka/modules/verify_forgot_password_code/data/repo/verify_forgot_password_repo.dart';
import 'package:flutter/material.dart';

class VerifyForgotPasswordCubit extends Cubit<VerifyForgotPasswordState> {
  final VerifyForgotPasswordRepo _verifyForgotPasswordRepo;
  VerifyForgotPasswordCubit(this._verifyForgotPasswordRepo)
      : super(VerifyForgotPasswordInitial());

//---------------------------------VARIABLES----------------------------------//
  bool _isOtpFilled = false;
  final TextEditingController otpController = TextEditingController();

//---------------------------------FUNCTIONS----------------------------------//
  bool get isOtpFilled => _isOtpFilled;
  void otpFilled() {
    if (otpController.text.length == 5) {
      _isOtpFilled = true;
    } else {
      _isOtpFilled = false;
    }
    emit(VerifyAccountOtpFilled());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> verifyForgotPasswordStatesHandled(
      VerifyForgotPasswordParams params) async {
    emit(const VerifyForgotPasswordLoading());
    final response =
        await _verifyForgotPasswordRepo.verifyForgotPassword(params);
    response.fold((failure) {
      return emit(VerifyForgotPasswordError(failure));
    }, (success) async {
      return emit(VerifyForgotPasswordSuccess(success));
    });
  }
}
