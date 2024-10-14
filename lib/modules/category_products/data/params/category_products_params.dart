import 'package:equatable/equatable.dart';

class CategoryProductsParams extends Equatable {
  const CategoryProductsParams({required this.page, required this.categoryId});
  final int page;
  final int categoryId;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"category": categoryId, "page": page};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [page, categoryId];
}
