import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/utils/home_utilites.dart';

class CategoryFieldModel extends CategoryFieldEntity {
  const CategoryFieldModel({
    required super.id,
    required super.fieldName,
    required super.fieldValue,
    required super.fieldType,
    required super.fieldIcon,
    required super.isRequired,
  });

  factory CategoryFieldModel.fromJson(Map<String, dynamic> json) {
    return CategoryFieldModel(
      id: json['id'],
      fieldName: json['field_name'],
      fieldIcon: json['field_icon'],
      isRequired: json['is_required'] == 1 ? true : false,
            fieldType: EnumSwitchReturn.getCategoryFieldTypes(json['input_type']),

      fieldValue: checkFromArray(json['options'])
          ? (json['options'] as List)
              .map((e) => CategoryFieldValuesModel.fromJson(e))
              .toList()
          : [],
    );
  }
}

class CategoryFieldValuesModel extends CategoryFieldValuesEntity {
  const CategoryFieldValuesModel({
    required super.id,
    required super.fieldValue,
    required super.isDefault,
  });

  factory CategoryFieldValuesModel.fromJson(Map<String, dynamic> json) {
    return CategoryFieldValuesModel(
      id: json['id'],
      fieldValue: json['option_text'],
      isDefault: json['is_default'] == 1 ? true : false,
    );
  }
}
