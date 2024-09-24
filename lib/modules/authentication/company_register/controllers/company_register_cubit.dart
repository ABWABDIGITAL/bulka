import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/modules/authentication/company_register/controllers/company_register_state.dart';
import 'package:bulka/modules/authentication/company_register/data/params/company_register_params.dart';
import 'package:bulka/modules/authentication/company_register/data/repo/company_register_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CompanyRegisterCubit extends Cubit<CompanyRegisterState> {
  final CompanyRegisterRepo _companyRegisterRepo;
  CompanyRegisterCubit(this._companyRegisterRepo)
      : super(CompanyRegisterInitial());
//---------------------------------VARIABLES----------------------------------//
  GlobalKey<FormState> companyKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneCodeController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  num? _countryId;
  num? _categoryId;

  bool _isVisiablePassword = false;
  bool _isVisiableConfirm = false;
  bool _agreePolicyAndConditions = false;

//---------------------------------FUNCTIONS----------------------------------//
  bool get isVisiablePassword => _isVisiablePassword;
  bool get isVisiableConfirm => _isVisiableConfirm;
  bool get agreePolicyAndConditions => _agreePolicyAndConditions;
  num? get countryId => _countryId;
  num? get categoryId => _categoryId;

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

  set categoryId(num? value) {
    _categoryId = value;
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
        CompanyRegisterError(
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
      emit(CompanyRegisterError(
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
      emit(CompanyRegisterError(
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
  Future<void> companyRegisterStatesHandled() async {
    if (!_isValid()) {
      return;
    }
    emit(CompanyRegisterLoading());
    final response = await _companyRegisterRepo.register(
      CompanyRegisterParams(
        comfirmPassword: passwordConfirmController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.fold((failure) {
      return emit(CompanyRegisterError(failure));
    }, (success) async {
      return emit(CompanyRegisterSuccess(success));
    });
  }
}
