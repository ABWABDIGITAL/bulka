import 'package:bulka/core/shared/models/token_model.dart';
import 'package:bulka/modules/authentication/verify_phone/data/entity/verify_phone_entity.dart';

class VerifyPhoneModel extends VerifyPhoneEntity {
  const VerifyPhoneModel({
    required super.message,
    required super.token,
  });

  factory VerifyPhoneModel.fromJson(Map<String, dynamic> json) {
    return VerifyPhoneModel(
      message: json['message'],
      token: TokenModel.fromJson(json['data']),
    );
  }
}
