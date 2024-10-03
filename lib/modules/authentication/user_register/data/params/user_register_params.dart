import 'package:equatable/equatable.dart';

class UserRegisterParams extends Equatable {
  const UserRegisterParams({
    required this.comfirmPassword,
    required this.countryId,
    required this.email,
    required this.fullName,
    required this.locale,
    required this.password,
    required this.phone,
    required this.phoneCode,
  });
  final String fullName;
  final String phone;
  final String phoneCode;
  final String email;
  final String password;
  final String comfirmPassword;
  final num countryId;
  final String locale;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "full_name": fullName,
      "phone": phone,
      "phone_code": phoneCode,
      "password": password,
      "comfirmPassword": comfirmPassword,
      "email": email,
      "country_id": countryId,
      "locale": locale,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [
        fullName,
        phone,
        phoneCode,
        email,
        password,
        comfirmPassword,
        countryId,
        locale,
      ];
}
