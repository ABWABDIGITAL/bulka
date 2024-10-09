import 'package:bulka/core/services/ad_details/data/model/ad_details_model.dart';
import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/see_all_ad/data/entity/see_all_entity.dart';

// ignore: must_be_immutable
class SeeAllModel extends SeeAllEntity {
  SeeAllModel({
    required super.ads,
    required super.paggination,
  });

  factory SeeAllModel.fromJson(Map<String, dynamic> json) {
    return SeeAllModel(
      ads: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => AdDetailsModel.fromJsonWithDirectJson(e))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}
