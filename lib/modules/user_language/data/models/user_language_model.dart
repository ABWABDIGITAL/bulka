import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';

class UserLanguageModel extends UserLanguageEntity {
  UserLanguageModel(
      {required super.language,
      required super.level,
      required super.id,
      required super.flag,
      required super.levelId,
      required super.langId});

  factory UserLanguageModel.fromUserLangJson(Map<String, dynamic> json) {
    return UserLanguageModel(
      levelId:checkFromMap(json['level']) ?json['level']['id']:0,
      langId: checkFromMap(json['language']) ? json['language']['id'] : 0,
      id: json['id'] ?? 0,
      language: checkFromMap(json['language'])
          ? json['language']['name']
          : 'no lang',
      level: checkFromMap(json['level'])
          ? json['level']['name']
          : 'no level',
      flag: checkFromMap(json['language'])
          ? json['language']['flag']
          : 'no flag',
    );
  }
  factory UserLanguageModel.fromLangJson(Map<String, dynamic> json) {
    return UserLanguageModel(
      levelId: json['levelId']??0,
      langId:  json['id']??0 ,
      id: json['id'] ?? 0,
      language:  json['name']
          ?? 'no lang',
      level:  json['level']
          ?? 'no level',
      flag: json['flag']
          ?? 'no flag',
    );
  }
}
