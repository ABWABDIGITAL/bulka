import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String phone;
  final String password;
  final String email;

  const LoginParams({
    required this.phone,
    required this.password,
    required this.email,
  });
  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "phone": phone,
      "password": password,
      "email": email,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [phone, password];
}
