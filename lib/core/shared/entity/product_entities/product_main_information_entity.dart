import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class ProductMainInformationEntity extends Equatable {
  const ProductMainInformationEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.isFav,
    required this.category,
    required this.image,
    required this.price,
    required this.adType,
  });
  final int id;
  final String name;
  final String description;
  final String? price;
  final String location;
  final bool isFav;
  final ProductCardWidgetDisplay? adType;
  final CategoryEntity category;
  final String image;

  @override
  List<Object?> get props =>
      [id, name, description, price, location, isFav, adType, category, image];
}
