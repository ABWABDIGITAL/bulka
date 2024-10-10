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
  });

  factory ProductMainInformationModel.fromJson(Map<String, dynamic> json) {
    return ProductMainInformationModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      location: json['location'],
      isFav: json['is_fav'],
      adType: EnumSwitchReturn.getProductCardWidget(json['ad_type']),
      category: CategoryModel.fromJson(json['category']),
      image:
          checkFromArray(json['ad_media']) ? json['ad_media'][0]['media'] : '',
    );
  }
}
