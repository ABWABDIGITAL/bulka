part of 'contact_info_cubit.dart';

sealed class ContactInfoState {
  const ContactInfoState();
}

final class ContactInfoInitial extends ContactInfoState {}
//---------------------------------Verify Phone OTP----------------------------------//

final class ContactInfoVerifyPhoneOtpLoading extends ContactInfoState {
  const ContactInfoVerifyPhoneOtpLoading();
}

final class ContactInfoVerifyPhoneOtpSuccess extends ContactInfoState {
  const ContactInfoVerifyPhoneOtpSuccess(
    this.message,
  );
  final String message;
}

final class ContactInfoVerifyPhoneOtpError extends ContactInfoState {
  const ContactInfoVerifyPhoneOtpError(this.error);
  final ApiErrorEntity error;
}
//---------------------------------update Phone----------------------------------//

final class ContactInfoUpdatePhoneLoading extends ContactInfoState {
  const ContactInfoUpdatePhoneLoading();
}

final class ContactInfoUpdatePhoneSuccess extends ContactInfoState {
  const ContactInfoUpdatePhoneSuccess(
    this.message,
  );
  final String message;
}

final class ContactInfoUpdatePhoneError extends ContactInfoState {
  const ContactInfoUpdatePhoneError(this.error);
  final ApiErrorEntity error;
}//---------------------------------Verify Phone OTP----------------------------------//

final class ContactInfoVerifyEmailOtpLoading extends ContactInfoState {
  const ContactInfoVerifyEmailOtpLoading();
}

final class ContactInfoVerifyEmailOtpSuccess extends ContactInfoState {
  const ContactInfoVerifyEmailOtpSuccess(
    this.message,
  );
  final String message;
}

final class ContactInfoVerifyEmailOtpError extends ContactInfoState {
  const ContactInfoVerifyEmailOtpError(this.error);
  final ApiErrorEntity error;
}
//---------------------------------update Email----------------------------------//

final class ContactInfoUpdateEmailLoading extends ContactInfoState {
  const ContactInfoUpdateEmailLoading();
}

final class ContactInfoUpdateEmailSuccess extends ContactInfoState {
  const ContactInfoUpdateEmailSuccess(
    this.message,
  );
  final String message;
}

final class ContactInfoUpdateEmailError extends ContactInfoState {
  const ContactInfoUpdateEmailError(this.error);
  final ApiErrorEntity error;
}
//---------------------------------Edit Phone----------------------------------//

final class ContactInfoEditPhone extends ContactInfoState {}

final class ContactInfoEditEmail extends ContactInfoState {}

final class ContactInfoCheckPhoneValue extends ContactInfoState {}

final class ContactInfoCheckEmailValue extends ContactInfoState {}

final class ContactInfoVerifyPhoneOtpFilled extends ContactInfoState {}
