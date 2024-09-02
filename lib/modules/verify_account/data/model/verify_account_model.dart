import 'package:bulka/modules/verify_account/data/entity/verify_account_entity.dart';

class VerifyAccountModel extends VerifyAccountEntity {
  const VerifyAccountModel({required super.message});

  factory VerifyAccountModel.fromJson(Map<String, dynamic> json) {
    return VerifyAccountModel(message: json['message']);
  }
}
