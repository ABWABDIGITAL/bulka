import 'package:bloc/bloc.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_state.dart';
import 'package:bulka/modules/authentication/user_register/data/params/user_register_params.dart';
import 'package:bulka/modules/authentication/user_register/data/repo/user_register_repo.dart';
import 'package:flutter/material.dart';

class UserRegisterCubit extends Cubit<UserRegisterState> {
  final UserRegisterRepo _userRegisterRepo;
  UserRegisterCubit(this._userRegisterRepo) : super(UserRegisterInitial());
//---------------------------------VARIABLES----------------------------------//
  GlobalKey<FormState> userRegisterKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isVisiablePassword = false;
  bool _isVisiableConfirm = false;
  bool _agreePolicyAndConditions = false;

//---------------------------------FUNCTIONS----------------------------------//
  bool get isVisiablePassword => _isVisiablePassword;
  bool get isVisiableConfirm => _isVisiableConfirm;
  bool get agreePolicyAndConditions => _agreePolicyAndConditions;
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

//----------------------------------REQUEST-----------------------------------//
  Future<void> userRegisterStatesHandled() async {
    emit(UserRegisterLoading());
    final response = await _userRegisterRepo.register(
      UserRegisterParams(
        comfirmPassword: passwordConfirmController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.fold((failure) {
      return emit(UserRegisterError(failure));
    }, (success) async {
      return emit(UserRegisterSuccess(success));
    });
  }
}
