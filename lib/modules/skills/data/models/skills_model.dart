import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';

class SkillsModel extends SkillsEntity {
  const SkillsModel(
      {required super.name, required super.skillId, required super.id});

  factory SkillsModel.fromUserSkillsJson(Map<String, dynamic> json) {
    return SkillsModel(
        id: json['id'] ?? 0,
        skillId: checkFromMap(json['skill']) ? json['skill']['id'] : 0,
        name: checkFromMap(json['skill']) ? json['skill']['name'] : 'no name');
  }
  factory SkillsModel.fromSkillsJson(Map<String, dynamic> json) {
    return SkillsModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? 'no name',
        skillId: json['id'] ?? 0);
  }
}
