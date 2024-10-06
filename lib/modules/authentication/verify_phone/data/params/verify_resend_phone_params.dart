import 'package:equatable/equatable.dart';

class VerifyResendPhoneParams extends Equatable {
  const VerifyResendPhoneParams({required this.phone, required this.phoneCode});
  final String phone;
  final String phoneCode;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "phone": phone,
      "phone_code": phoneCode,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [phone, phoneCode];
}
