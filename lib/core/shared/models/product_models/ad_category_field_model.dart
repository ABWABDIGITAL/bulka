import 'package:bulka/core/shared/entity/product_entities/ad_category_field_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/utils/home_utilites.dart';

class AdCategoryFieldModel extends AdCategoryFieldEntity {
  const AdCategoryFieldModel({
    required super.id,
    required super.fieldName,
    required super.fieldValues,
    required super.fieldType,
    required super.categoryFieldData,
  });

  factory AdCategoryFieldModel.fromJson(Map<String, dynamic> json) {
    return AdCategoryFieldModel(
      id: json['id'],
      fieldName: getSuitableNameLanguageForScreen(json['field_name']),
      fieldValues: getSuitableNameLanguageForScreen(json['field_values']),
      fieldType: EnumSwitchReturn.getFieldType(json['field_type']),
      categoryFieldData:
          CategoryFieldDataModel.fromJson(json['category_field_data']),
    );
  }
}

class CategoryFieldDataModel extends CategoryFieldDataEntity {
  const CategoryFieldDataModel({
    required super.id,
    required super.fieldName,
    required super.fieldDescription,
    required super.inputType,
    required super.fieldIcon,
  });

  factory CategoryFieldDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryFieldDataModel(
      id: json['id'],
      fieldName: getSuitableNameLanguageForScreen(json['field_name']),
      fieldDescription:
          getSuitableNameLanguageForScreen(json['field_description']),
      inputType: EnumSwitchReturn.getFieldType(json['input_type']),
      fieldIcon: json['field_icon'],
    );
  }
}
