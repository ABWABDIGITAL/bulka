import 'package:bulka/core/shared/models/product_models/ad_category_field_model.dart';
import 'package:bulka/core/shared/models/product_models/ad_media_model.dart';
import 'package:bulka/core/shared/models/product_models/product_main_information_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/home/data/entity/home_product_entity.dart';

class HomeProductModel extends HomeProductEntity {
  const HomeProductModel({
    required super.adCategoryField,
    required super.adMedia,
    required super.mainInformation,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      adCategoryField: checkFromArray(json['ad_category_fields'])
          ? (json['ad_category_fields'] as List)
              .map((e) => AdCategoryFieldModel.fromJson(e))
              .toList()
          : [],
      adMedia: checkFromArray(json['ad_media'])
          ? (json['ad_media'] as List)
              .map((e) => AdMediaModel.fromJson(e))
              .toList()
          : [],
      mainInformation: ProductMainInformationModel.fromJson(json),
    );
  }
}
