import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/reset_password/controllers/reset_password_state.dart';
import 'package:bulka/modules/authentication/reset_password/data/params/reset_password_params.dart';
import 'package:bulka/modules/authentication/reset_password/data/repo/reset_password_repo.dart';
import 'package:easy_localization/easy_localization.dart';
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

  bool _isValid() {
    bool isValid = true;

    if (newPasswordController.text != confirmPasswordController.text) {
      emit(ResetPasswordError(
        ApiErrorEntity(
          message: AppStrings.mismatchedPassword.tr(),
          code: ResponseCode.validationError,
          errors: [
            AppStrings.mismatchedPassword.tr(),
          ],
          status: false,
        ),
      ));
      return isValid = false;
    }

    return isValid;
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> resetPasswordStatesHandled() async {
    if (!_isValid()) {
      return;
    }
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
