import 'package:bloc/bloc.dart';
import 'package:bulka/modules/verify_account/controllers/verify_account_state.dart';
import 'package:bulka/modules/verify_account/data/params/verift_account_params.dart';
import 'package:bulka/modules/verify_account/data/repo/verify_account_repo.dart';
import 'package:flutter/material.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  final VerifyAccountRepo _verifyAccountRepo;
  VerifyAccountCubit(this._verifyAccountRepo) : super(VerifyAccountInitial());
//---------------------------------VARIABLES----------------------------------//
  bool _isOtpFilled = false;
  final TextEditingController otpController = TextEditingController();
//---------------------------------FUNCTIONS----------------------------------//
  bool get isOtpFilled => _isOtpFilled;
  void otpFilled() {
    if (otpController.text.length == 5) {
      _isOtpFilled = true;
    } else {
      _isOtpFilled = false;
    }
    emit(VerifyAccountOtpFilled());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> verifyAccountStatesHandled() async {
    emit(const VerifyOtpLoading());
    final response = await _verifyAccountRepo.verify(
      VeriftAccountParams(code: otpController.text),
    );
    response.fold((failure) {
      return emit(VerifyOtpError(failure));
    }, (success) async {
      return emit(VerifyOtpSuccess(success));
    });
  }
}
