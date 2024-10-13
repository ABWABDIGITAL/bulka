import 'package:bulka/core/services/categories/data/model/category_model.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/utils/home_utilites.dart';

class ProductMainInformationModel extends ProductMainInformationEntity {
  const ProductMainInformationModel({
    required super.id,
    required super.name,
    required super.description,
    required super.location,
    required super.isFav,
    required super.category,
    required super.image,
    required super.price,
    required super.adType,
    required super.user,
  });

  factory ProductMainInformationModel.fromJson(Map<String, dynamic> json) {
    return ProductMainInformationModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      location: json['location'],
      isFav: json['is_fav'] ?? false,
      adType: EnumSwitchReturn.getProductCardWidget(json['ad_type']),
      category: CategoryModel.fromJson(json['category']),
      image:
          checkFromArray(json['ad_media']) ? json['ad_media'][0]['media'] : '',
      user: AdUserInfoModel.fromJson(json['user']),
    );
  }
}

class AdUserInfoModel extends AdUserInfoEntity {
  const AdUserInfoModel({
    required super.id,
    required super.fullName,
    required super.userType,
    required super.email,
    required super.phoneCode,
    required super.phone,
    required super.avatar,
  });

  factory AdUserInfoModel.fromJson(Map<String, dynamic> json) {
    return AdUserInfoModel(
      id: json['id'],
      fullName: json['full_name'],
      userType: EnumSwitchReturn.getUserType(json['user_type']),
      email: json['email'],
      phoneCode: json['phone_code'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }
}
