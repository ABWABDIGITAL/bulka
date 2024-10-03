import 'package:equatable/equatable.dart';

class SubSubcategoryParams extends Equatable {
  const SubSubcategoryParams({required this.subcategoryId});
  final dynamic subcategoryId;

  @override
  List<Object?> get props => [subcategoryId];
}
