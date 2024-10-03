import 'package:equatable/equatable.dart';

class SubcategoryParams extends Equatable {
  const SubcategoryParams({required this.categoryId});
  final dynamic categoryId;

  @override
  List<Object?> get props => [categoryId];
}
