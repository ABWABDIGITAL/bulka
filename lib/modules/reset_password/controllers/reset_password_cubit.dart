import 'package:bloc/bloc.dart';
import 'package:bulka/modules/reset_password/controllers/reset_password_state.dart';
import 'package:bulka/modules/reset_password/data/params/reset_password_params.dart';
import 'package:bulka/modules/reset_password/data/repo/reset_password_repo.dart';
import 'package:flutter/material.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;
  ResetPasswordCubit(this._resetPasswordRepo) : super(ResetPasswordInitial());
//---------------------------------VARIABLES----------------------------------//
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> resetKey = GlobalKey<FormState>();
  bool _isVisiablePassword = false;
  bool _isVisiableConfirm = false;

//---------------------------------FUNCTIONS----------------------------------//
  bool get isVisiablePassword => _isVisiablePassword;
  bool get isVisiableConfirm => _isVisiableConfirm;

  void changeVisibilityPassword() {
    _isVisiablePassword = !_isVisiablePassword;
    emit(ChangePasswordStatus());
  }

  void changeVisibilityConfirmPassword() {
    _isVisiableConfirm = !_isVisiableConfirm;
    emit(ChangePasswordStatus());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> resetPasswordStatesHandled() async {
    emit(ResetPasswordLoading());
    final response = await _resetPasswordRepo.resetPassword(ResetPasswordParams(
      confirmPassword: confirmPasswordController.text,
      newPassword: newPasswordController.text,
    ));
    response.fold((failure) {
      return emit(ResetPasswordError(failure));
    }, (success) async {
      return emit(ResetPasswordSuccess(success));
    });
  }
}
