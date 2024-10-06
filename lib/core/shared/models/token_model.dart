import 'package:bulka/core/shared/entity/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({required super.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }
}
