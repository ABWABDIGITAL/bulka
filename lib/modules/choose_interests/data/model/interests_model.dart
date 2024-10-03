import 'dart:math';

import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';

class InterestsModel extends InterestsEntity {
  const InterestsModel({
    required super.image,
    required super.name,
    required super.id,
  });

  factory InterestsModel.fromJson(Map<String, dynamic> json) {
    return InterestsModel(
      image: json['image'],
      name: json['name'],
      id: json['id'] ?? Random().nextInt(1000),
    );
  }
}
