import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class CategoryFieldEntity extends Equatable {
  const CategoryFieldEntity({
    required this.id,
    required this.fieldName,
    required this.fieldValue,
    required this.fieldType,
  });
  final int id;
  final String fieldName;
  final List<CategoryFieldValuesEntity> fieldValue;
  final CategoryFieldTypes fieldType;

  @override
  List<Object?> get props => [id, fieldName, fieldValue, fieldType];
}

class CategoryFieldValuesEntity extends Equatable {
  const CategoryFieldValuesEntity({
    required this.id,
    required this.fieldValue,
  });
  final int id;
  final String fieldValue;

  @override
  List<Object?> get props => [id, fieldValue];
}
