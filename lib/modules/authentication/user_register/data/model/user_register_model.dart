import 'package:bulka/modules/authentication/user_register/data/entity/user_reigster_entity.dart';

class UserRegisterModel extends UserRegisterEntity {
  const UserRegisterModel({required super.message});

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterModel(message: json['message']);
  }
}
