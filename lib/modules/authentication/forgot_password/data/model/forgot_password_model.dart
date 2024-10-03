import 'package:bulka/modules/authentication/forgot_password/data/entity/forgot_password_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  const ForgotPasswordModel({required super.message});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(message: json['message']);
  }
}
