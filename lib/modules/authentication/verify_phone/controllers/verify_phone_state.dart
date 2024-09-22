import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/authentication/verify_phone/data/entity/resend_verify_phone_entity.dart';
import 'package:bulka/modules/authentication/verify_phone/data/entity/verify_phone_entity.dart';

sealed class VerifyPhoneState {
  const VerifyPhoneState();
}

final class VerifyPhoneInitial extends VerifyPhoneState {}

final class VerifyPhoneOtpFilled extends VerifyPhoneState {}

final class VerifyPhoneOtpLoading extends VerifyPhoneState {
  const VerifyPhoneOtpLoading();
}

final class VerifyPhoneOtpSuccess extends VerifyPhoneState {
  VerifyPhoneOtpSuccess(this.verify);
  final VerifyPhoneEntity verify;
}

final class VerifyPhoneOtpError extends VerifyPhoneState {
  VerifyPhoneOtpError(this.error);
  final ApiErrorEntity error;
}

final class ResendVerifyPhoneOtpLoading extends VerifyPhoneState {
  const ResendVerifyPhoneOtpLoading();
}

final class ResendVerifyPhoneOtpSuccess extends VerifyPhoneState {
  ResendVerifyPhoneOtpSuccess(this.verify);
  final ResendVerifyPhoneEntity verify;
}

final class ResendVerifyPhoneOtpError extends VerifyPhoneState {
  ResendVerifyPhoneOtpError(this.error);
  final ApiErrorEntity error;
}
