import 'package:bulka/core/services/subcategory/data/entity/subcategory_entity.dart';

class SubcategoryModel extends SubcategoryEntity {
  const SubcategoryModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory SubcategoryModel.fromJson(Map<String, dynamic> json) {
    return SubcategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
