import 'package:bulka/core/services/sub_subcategory/data/entity/sub_subcategory_entity.dart';

class SubSubcategoryModel extends SubSubcategoryEntity {
  const SubSubcategoryModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory SubSubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubSubcategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
