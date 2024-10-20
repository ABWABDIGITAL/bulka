import 'package:bulka/modules/user_language/data/entities/all_levels_entity.dart';

class AllLevelsModel extends AllLevelsEntity {
  AllLevelsModel({required super.id, required super.level});

  factory AllLevelsModel.fromJson(Map<String, dynamic> json) {
    return AllLevelsModel(id: json['id'], level: json['name']);
  }
}
