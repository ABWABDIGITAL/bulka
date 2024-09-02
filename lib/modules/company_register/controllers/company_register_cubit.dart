import 'package:bloc/bloc.dart';
import 'package:bulka/modules/company_register/controllers/company_register_state.dart';
import 'package:bulka/modules/company_register/data/params/company_register_params.dart';
import 'package:bulka/modules/company_register/data/repo/company_register_repo.dart';
import 'package:flutter/material.dart';

class CompanyRegisterCubit extends Cubit<CompanyRegisterState> {
  final CompanyRegisterRepo _companyRegisterRepo;
  CompanyRegisterCubit(this._companyRegisterRepo)
      : super(CompanyRegisterInitial());
//---------------------------------VARIABLES----------------------------------//
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
  Future<void> companyRegisterStatesHandled() async {
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
