import 'package:equatable/equatable.dart';

class ContactInfoVerifyPhoneParams extends Equatable {
  const ContactInfoVerifyPhoneParams({
    required this.phone,
    this.resendCode,
    required this.phoneCode,
  });
  final String phone;
  final String? resendCode;
  final String phoneCode;

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "phone": phone,
      "resend_code": resendCode,
      'phone_code': phoneCode,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [phone, resendCode];
}
