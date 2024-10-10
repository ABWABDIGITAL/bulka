import 'package:bulka/core/services/ad_details/data/model/ad_details_model.dart';
import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/category_products/data/entity/category_products_entity.dart';

// ignore: must_be_immutable
class CategoryProductsModel extends CategoryProductsEntity {
  CategoryProductsModel({
    required super.ads,
    required super.paggination,
  });

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return CategoryProductsModel(
      ads: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => AdDetailsModel.fromJsonWithDirectJson(e))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}
