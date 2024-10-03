import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/utils/home_utilites.dart';

class CategoryFieldModel extends CategoryFieldEntity {
  const CategoryFieldModel({
    required super.id,
    required super.fieldName,
    required super.fieldValue,
    required super.fieldType,
  });

  factory CategoryFieldModel.fromJson(Map<String, dynamic> json) {
    return CategoryFieldModel(
      id: json['id'],
      fieldName: json['field_name'],
      fieldValue: checkFromArray(json['CategoryFieldValuesEntity'])
          ? (json['CategoryFieldValuesEntity'] as List)
              .map((e) => CategoryFieldValuesModel.fromJson(e))
              .toList()
          : [],
      fieldType: EnumSwitchReturn.getCategoryFieldTypes(json['field_type']),
    );
  }
}

class CategoryFieldValuesModel extends CategoryFieldValuesEntity {
  const CategoryFieldValuesModel({
    required super.id,
    required super.fieldValue,
  });

  factory CategoryFieldValuesModel.fromJson(Map<String, dynamic> json) {
    return CategoryFieldValuesModel(
      id: json['id'],
      fieldValue: json['field_value'],
    );
  }
}
