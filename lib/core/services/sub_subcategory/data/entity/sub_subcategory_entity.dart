import 'package:equatable/equatable.dart';

class SubSubcategoryEntity extends Equatable {
  const SubSubcategoryEntity({
    required this.id,
    required this.image,
    required this.name,
  });
  final int id;
  final String image;
  final String name;

  @override
  List<Object?> get props => [id, image, name];
}
