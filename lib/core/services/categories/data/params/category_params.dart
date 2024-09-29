import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class CategoryParams extends Equatable {
  const CategoryParams({required this.categoryType});
  final CategoryTypes categoryType;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "category_type": categoryType.name,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [categoryType];
}
