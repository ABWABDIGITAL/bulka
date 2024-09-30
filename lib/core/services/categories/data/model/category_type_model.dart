import 'package:bulka/core/services/categories/data/entity/category_type_entity.dart';

class CategoryTypeModel extends CategoryTypeEntity {
  const CategoryTypeModel({
    required super.name,
    required super.key,
    required super.icon,
    required super.id,
  });

  factory CategoryTypeModel.fromJson(Map<String, dynamic> json) {
    return CategoryTypeModel(
      name: json['name'],
      key: json['key'],
      icon: json['icon'],
      id: json['id'] ?? 0,
    );
  }
}
