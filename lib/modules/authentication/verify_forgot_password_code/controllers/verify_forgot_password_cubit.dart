import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/authentication/forgot_password/data/params/forgot_password_with_phone_params.dart';
import 'package:bulka/modules/authentication/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/controllers/verify_forgot_password_state.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/params/verify_forgot_password_params.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/repo/verify_forgot_password_repo.dart';
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
    if (otpController.text.length == 6) {
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

  Future<void> resendVerifyPasswordViaPhoneStatesHandled(
      ForgotPasswordWithPhoneParams params) async {
    final ForgotPasswordRepo repo = sl<ForgotPasswordRepo>();
    emit(const ResendForgetPasswordLoading());
    final response = await repo.forgotPasswordViaPhone(params);
    response.fold((failure) {
      return emit(ResendForgetPasswordError(failure));
    }, (success) async {
      return emit(ResendForgetPasswordSuccess(success));
    });
  }
}
