import 'package:bulka/core/shared/models/token_model.dart';
import 'package:bulka/modules/authentication/login/data/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    required super.message,
    required super.tokenEntity,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] ?? "dummy",
      tokenEntity: TokenModel.fromJson(json['data']),
    );
  }
}
