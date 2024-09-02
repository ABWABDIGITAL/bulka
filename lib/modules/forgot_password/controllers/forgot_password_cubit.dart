import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/forgot_password/data/entity/forgot_password_entity.dart';
import 'package:bulka/modules/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordRepo _forgotPasswordRepo;
  ForgotPasswordCubit(this._forgotPasswordRepo)
      : super(ForgotPasswordInitial());
//---------------------------------VARIABLES----------------------------------//
  VerifyAccountMethod _verifyAccountMethod = VerifyAccountMethod.email;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> forgotKey = GlobalKey<FormState>();
//---------------------------------FUNCTIONS----------------------------------//
  VerifyAccountMethod get verifyAccountMethod => _verifyAccountMethod;

  void setVerifyAccountMethod(VerifyAccountMethod method) {
    _verifyAccountMethod = method;
    emit(ChooseVerifyMethodChanged());
  }

//---------------------------------REQUEST----------------------------------//
  Future<void> forgotPasswordViaEmailStatesHandled(
      AccountForgotPassword params) async {
    emit(const GetForgotPasswordCodeLoading());
    final response = await _forgotPasswordRepo.forgotPasswordCode(params);
    response.fold((failure) {
      return emit(GetForgotPasswordCodeError(failure));
    }, (success) async {
      return emit(GetForgotPasswordCodeSuccess(success));
    });
  }
}
