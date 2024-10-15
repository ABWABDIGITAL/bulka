import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';

class SkillsModel extends SkillsEntity {
  const SkillsModel(
      {required super.skillId, required super.name, required super.id});

  factory SkillsModel.fromJson(Map<String, dynamic> json) {
    return SkillsModel(
        id: json['id'],
        skillId: checkFromMap(json['skill']) ? json['skill']['id'] : 0,
        name: checkFromMap(json['skill']) ? json['skill']['name'] : 0);
  }
}
