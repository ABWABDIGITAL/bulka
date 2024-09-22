import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/notifications/firebase_notification_api.dart';
import 'package:bulka/core/utils/widgets/device_type/device_type.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_state.dart';
import 'package:bulka/modules/authentication/verify_phone/data/params/verify_phone_params.dart';
import 'package:bulka/modules/authentication/verify_phone/data/params/verify_resend_phone_params.dart';
import 'package:bulka/modules/authentication/verify_phone/data/repo/verify_phone_repo.dart';
import 'package:flutter/material.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  final VerifyPhoneRepo verifyPhoneRepo;
  VerifyPhoneCubit({
    required this.verifyPhoneRepo,
    required this.params,
  }) : super(VerifyPhoneInitial());
//---------------------------------VARIABLES----------------------------------//
  bool _isOtpFilled = false;
  final TextEditingController otpController = TextEditingController();
  final ChooseVerifyMethodParams params;
  final GlobalKey<FormState> verifyKey = GlobalKey<FormState>();
//---------------------------------FUNCTIONS----------------------------------//
  bool get isOtpFilled => _isOtpFilled;
  void otpFilled() {
    if (otpController.text.length == 6) {
      _isOtpFilled = true;
    } else {
      _isOtpFilled = false;
    }
    emit(VerifyPhoneOtpFilled());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> verifyWithPhoneStatesHandled() async {
    emit(const VerifyPhoneOtpLoading());
    final response = await verifyPhoneRepo.verifyWithPhone(
      VerifyPhoneParams(
        phoneCode: params.phoneCode,
        phone: params.phone,
        resetCode: otpController.text,
        deviceToken: fcmToken ?? "null",
        deviceType: DeviceType.getDeviceType(),
      ),
    );
    response.fold((failure) {
      return emit(VerifyPhoneOtpError(failure));
    }, (success) async {
      return emit(VerifyPhoneOtpSuccess(success));
    });
  }

  Future<void> resendVerifyWithPhoneStatesHandled() async {
    emit(const ResendVerifyPhoneOtpLoading());
    final response = await verifyPhoneRepo.resendVerifyWithPhone(
      VerifyResendPhoneParams(
        phoneCode: params.phoneCode,
        phone: params.phone,
      ),
    );
    response.fold((failure) {
      return emit(ResendVerifyPhoneOtpError(failure));
    }, (success) async {
      return emit(ResendVerifyPhoneOtpSuccess(success));
    });
  }
}
