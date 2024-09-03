import 'package:bulka/modules/authentication/verify_forgot_password_code/data/entity/verify_forgot_password_entity.dart';

class VerifyForgotPasswordModel extends VerifyForgotPasswordEntity {
  const VerifyForgotPasswordModel({required super.message});

  factory VerifyForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgotPasswordModel(message: json['message']);
  }
}
