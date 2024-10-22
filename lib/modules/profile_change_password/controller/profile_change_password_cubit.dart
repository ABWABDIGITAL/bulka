import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/profile_change_password/data/params/profile_change_password.dart';
import 'package:bulka/modules/profile_change_password/data/repo/profile_change_password_repo.dart';
import 'package:flutter/material.dart';

part 'profile_change_password_state.dart';

class ProfileChangePasswordCubit extends Cubit<ProfileChangePasswordState> {
  final ProfileChangePasswordRepo _changePasswordRepo;
  ProfileChangePasswordCubit(this._changePasswordRepo)
      : super(ProfileChangePasswordInitial());
//-------------------------------------variables-------------------------------------//
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  bool isVisiableOld = false;
  bool isVisiableNew = false;
  bool isVisiableconfirmNew=false;

  //------------------------------functions-------------------------------------//
  
  void changeOldVisibility() {
    isVisiableOld = !isVisiableOld;
    emit(ProfileOldPasswordStatus());
  }

  void changeNewVisibility() {
    isVisiableNew = !isVisiableNew;
    emit(ProfileNewPasswordStatus());
  }

  void changeConfirmNewVisibility() {
    isVisiableconfirmNew = !isVisiableconfirmNew;
    emit(ProfileConfirmNewPasswordStatus());
  }

  //------------------------------requests-------------------------------------//
  void changePassword() {
    emit(ProfileChangePasswordLoading());
    final params = ProfileChangePasswordParams(
      oldPassword: oldPasswordController.text,
      newPassword: newPasswordController.text,
    );
    _changePasswordRepo.changePassword(params).then((value) {
      value.fold((error) {
        emit(ProfileChangePasswordError(error));
      }, (result) {
        emit(ProfileChangePasswordLoaded(result));
      });
    });
  }
}
