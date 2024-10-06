import 'package:bloc/bloc.dart';
import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_state.dart';
import 'package:bulka/modules/authentication/user_register/data/params/user_register_params.dart';
import 'package:bulka/modules/authentication/user_register/data/repo/user_register_repo.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  final UserRegisterRepo _userRegisterRepo;
  UserRegisterCubit(this._userRegisterRepo) : super(UserRegisterInitial());
//---------------------------------VARIABLES----------------------------------//
  GlobalKey<FormState> userRegisterKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  num? _countryId;
  bool _isVisiablePassword = false;
  bool _isVisiableConfirm = false;
  bool _agreePolicyAndConditions = false;

//---------------------------------FUNCTIONS----------------------------------//
  bool get isVisiablePassword => _isVisiablePassword;
  bool get isVisiableConfirm => _isVisiableConfirm;
  bool get agreePolicyAndConditions => _agreePolicyAndConditions;
  num? get countryId => _countryId;

  void changeAgreePolicyAndConditions() {
    _agreePolicyAndConditions = !_agreePolicyAndConditions;
    emit(ChangeAgreePolicyAndConditions());
  }

  void changeVisibilityPassword() {
    _isVisiablePassword = !_isVisiablePassword;
    emit(ChangePasswordStatus());
  }

  void changeVisibilityConfirmPassword() {
    _isVisiableConfirm = !_isVisiableConfirm;
    emit(ChangePasswordStatus());
  }

  set countryId(num? value) {
    _countryId = value;
  }

  void dispose() {
    passwordController.dispose();
    passwordConfirmController.dispose();
    emailController.dispose();
    phoneController.dispose();
    fullNameController.dispose();
    countryId = null;
  }

  bool _isValid() {
    bool isValid = true;
    if (_countryId == null) {
      emit(
        UserRegisterError(
          const ApiErrorEntity(
            message: 'country id null',
            code: ResponseCode.validationError,
            errors: ['country id null'],
            status: false,
          ),
        ),
      );
      return isValid = false;
    }
    if (passwordController.text != passwordConfirmController.text) {
      emit(UserRegisterError(
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

    if (currentLanguage == null) {
      emit(UserRegisterError(
        ApiErrorEntity(
          message: AppStrings.languageNotSelected.tr(),
          code: ResponseCode.validationError,
          errors: [
            AppStrings.languageNotSelected.tr(),
          ],
          status: false,
        ),
      ));
      return isValid = false;
    }
    return isValid;
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> userRegisterStatesHandled() async {
    emit(UserRegisterLoading());
    if (!_isValid()) {
      return;
    }

    final response = await _userRegisterRepo.register(
      UserRegisterParams(
        comfirmPassword: passwordConfirmController.text,
        email: emailController.text,
        password: passwordController.text,
        countryId: _countryId!,
        fullName: fullNameController.text,
        locale: currentLanguage!.locale.languageCode,
        phone: phoneController.text,
        phoneCode: phoneCodeController.text,
      ),
    );
    response.fold((failure) {
      return emit(UserRegisterError(failure));
    }, (success) async {
      return emit(UserRegisterSuccess(success));
    });
  }
}
