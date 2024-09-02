import 'package:bulka/modules/reset_password/data/entity/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity {
  const ResetPasswordModel({required super.message});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ResetPasswordModel(message: json['message']);
  }
}
