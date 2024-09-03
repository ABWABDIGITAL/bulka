import 'package:equatable/equatable.dart';

class UserRegisterParams extends Equatable {
  const UserRegisterParams({
    required this.comfirmPassword,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  final String comfirmPassword;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "email": email,
      "password": password,
      "comfirmPassword": comfirmPassword,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [email, password, comfirmPassword];
}
