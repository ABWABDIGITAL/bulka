import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class AdCategoryFieldEntity extends Equatable {
  const AdCategoryFieldEntity({
    required this.id,
    required this.fieldName,
    required this.fieldValues,
    required this.fieldType,
    required this.categoryFieldData,
  });
  final int id;
  final String fieldName;
  final String fieldValues;
  final FieldType? fieldType;
  final CategoryFieldDataEntity categoryFieldData;

  @override
  List<Object?> get props =>
      [id, fieldName, fieldValues, fieldType, categoryFieldData];
}

class CategoryFieldDataEntity extends Equatable {
  const CategoryFieldDataEntity({
    required this.id,
    required this.fieldName,
    required this.fieldDescription,
    required this.inputType,
    required this.fieldIcon,
  });
  final int id;
  final String fieldName;
  final String fieldDescription;
  final FieldType? inputType;
  final String? fieldIcon;

  @override
  List<Object?> get props =>
      [id, fieldName, fieldDescription, inputType, fieldIcon];
}
