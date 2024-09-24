import 'package:bulka/core/services/categories/data/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
