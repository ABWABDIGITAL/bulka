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
    required this.user,
  });
  final int id;
  final String name;
  final String description;
  final String? price;
  final String? location;
  final bool isFav;
  final ProductCardWidgetDisplay? adType;
  final CategoryEntity category;
  final String image;
  final AdUserInfoEntity user;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        location,
        isFav,
        adType,
        category,
        image,
        user
      ];
}

class AdUserInfoEntity extends Equatable {
  const AdUserInfoEntity({
    required this.id,
    required this.fullName,
    required this.userType,
    required this.email,
    required this.phoneCode,
    required this.phone,
    required this.avatar,
  });
  final int id;
  final String fullName;
  final UserType userType;
  final String email;
  final String? avatar;
  final String phoneCode;
  final String phone;

  @override
  List<Object?> get props => [
        id,
        fullName,
        userType,
        email,
        avatar,
        phoneCode,
        phone,
      ];
}
