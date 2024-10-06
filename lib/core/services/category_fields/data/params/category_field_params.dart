import 'package:equatable/equatable.dart';

class CategoryFieldParams extends Equatable {
  const CategoryFieldParams({required this.categoryId});
  final int categoryId;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"category_id": categoryId};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [categoryId];
}
