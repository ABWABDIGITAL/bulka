import 'package:equatable/equatable.dart';

class VerifyPhoneParams extends Equatable {
  const VerifyPhoneParams({
    required this.phoneCode,
    required this.resetCode,
    required this.deviceToken,
    required this.deviceType,
    required this.phone,
  });

  final String phoneCode;
  final String resetCode;
  final String phone;
  final String? deviceToken;
  final String deviceType;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "phone": phone,
      "phone_code": phoneCode,
      "reset_code": resetCode,
      "device_token": deviceToken,
      "device_type": deviceType,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props =>
      [phoneCode, resetCode, phone, deviceToken, deviceType];
}
