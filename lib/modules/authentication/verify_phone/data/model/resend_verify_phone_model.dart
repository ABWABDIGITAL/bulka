import 'package:bulka/modules/authentication/verify_phone/data/entity/resend_verify_phone_entity.dart';

class ResendVerifyPhoneModel extends ResendVerifyPhoneEntity {
  const ResendVerifyPhoneModel({required super.message});

  factory ResendVerifyPhoneModel.fromJson(Map<String, dynamic> json) {
    return ResendVerifyPhoneModel(message: json['message']);
  }
}
