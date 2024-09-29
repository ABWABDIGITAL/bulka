import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.image,
    required super.name,
    required super.type,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      type: EnumSwitchReturn.getCategoryType(json['category_type']),
    );
  }
}
