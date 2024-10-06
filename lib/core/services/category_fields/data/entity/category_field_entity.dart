import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class CategoryFieldEntity extends Equatable {
  const CategoryFieldEntity({
    required this.id,
    required this.fieldName,
    required this.fieldType,
    required this.fieldIcon,
    required this.isRequired,
    required this.fieldValue,
  });
  final int id;
  final String fieldName;
  final String? fieldIcon;
  final bool isRequired;
  final List<CategoryFieldValuesEntity> fieldValue;
  final CategoryFieldTypes fieldType;

  @override
  List<Object?> get props =>
      [id, fieldName, fieldIcon, isRequired, fieldValue, fieldType];
}

class CategoryFieldValuesEntity extends Equatable {
  const CategoryFieldValuesEntity({
    required this.id,
    required this.fieldValue,
    required this.isDefault,
  });
  final int id;
  final dynamic fieldValue;
  final bool isDefault;

  @override
  List<Object?> get props => [id, fieldValue, isDefault];
}
