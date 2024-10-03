import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
  });

  final int id;
  final String image;
  final String name;
  final CategoryTypes? type;

  @override
  List<Object?> get props => [id, image, name, type];
}
