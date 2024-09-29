import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({
    required this.newPassword,
    required this.confirmPassword,
    required this.phone,
    required this.phoneCode,
    required this.resetCode,
  });
  final String phone;
  final String phoneCode;
  final String resetCode;
  final String newPassword;
  final String confirmPassword;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "phone": phone,
      "phone_code": phoneCode,
      "reset_code": resetCode,
      "password": newPassword,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props =>
      [phone, phoneCode, resetCode, newPassword, confirmPassword];
}
