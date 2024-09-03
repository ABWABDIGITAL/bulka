import 'package:bulka/modules/authentication/login/controllers/login_state.dart';
import 'package:bulka/modules/authentication/login/data/params/login_params.dart';
import 'package:bulka/modules/authentication/login/data/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginInitial());
//---------------------------------VARIABLES----------------------------------//
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isVisiable = false;
  bool _isRememberMe = false;

//---------------------------------FUNCTIONS----------------------------------//
  bool get isVisiable => _isVisiable;
  bool get isRememberMe => _isRememberMe;
  void changeVisibility() {
    _isVisiable = !_isVisiable;
    emit(ChangePasswordStatus());
  }

  void changeRememberMe() {
    _isRememberMe = !_isRememberMe;
    emit(ChangeRememberMeStatus());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> loginStatesHandled() async {
    emit(const LoginStateLoading());
    final response = await _loginRepo.login(
      LoginParams(
        phone: emailController.text,
        password: passwordController.text,
        email: emailController.text,
      ),
    );
    response.fold((failure) {
      return emit(LoginStateError(failure));
    }, (success) async {
      return emit(LoginStateSuccess(success));
    });
  }
}
