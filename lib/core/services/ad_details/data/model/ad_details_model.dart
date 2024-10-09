import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';
import 'package:bulka/core/shared/models/product_models/ad_category_field_model.dart';
import 'package:bulka/core/shared/models/product_models/ad_media_model.dart';
import 'package:bulka/core/shared/models/product_models/product_main_information_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';

class AdDetailsModel extends AdDetailsEntity {
  const AdDetailsModel(
      {required super.mainInfo,
      required super.adMedia,
      required super.adCategoryField});

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) {
    return AdDetailsModel(
      mainInfo: ProductMainInformationModel.fromJson(json['data']),
      adMedia: checkFromArray(json['data']['ad_media'])
          ? (json['data']['ad_media'] as List)
              .map((e) => AdMediaModel.fromJson(e))
              .toList()
          : [],
      adCategoryField: checkFromArray(json['data']['ad_category_fields'])
          ? (json['data']['ad_category_fields'] as List)
              .map((e) => AdCategoryFieldModel.fromJson(e))
              .toList()
          : [],
    );
  }
  factory AdDetailsModel.fromJsonWithDirectJson(Map<String, dynamic> json) {
    return AdDetailsModel(
      mainInfo: ProductMainInformationModel.fromJson(json),
      adMedia: checkFromArray(json['ad_media'])
          ? (json['ad_media'] as List)
              .map((e) => AdMediaModel.fromJson(e))
              .toList()
          : [],
      adCategoryField: checkFromArray(json['ad_category_fields'])
          ? (json['ad_category_fields'] as List)
              .map((e) => AdCategoryFieldModel.fromJson(e))
              .toList()
          : [],
    );
  }
}
