import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class CategoryFieldParams extends Equatable {
  const CategoryFieldParams({required this.categoryTypes});
  final CategoryTypes categoryTypes;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"category_type": categoryTypes.name};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [categoryTypes];
}
