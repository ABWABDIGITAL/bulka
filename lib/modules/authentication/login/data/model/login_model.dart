import 'package:bulka/modules/authentication/login/data/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] ?? "dummy",
    );
  }
}
