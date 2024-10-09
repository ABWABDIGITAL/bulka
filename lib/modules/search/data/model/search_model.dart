import 'package:bulka/core/services/ad_details/data/model/ad_details_model.dart';
import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/search/data/entity/search_entity.dart';

// ignore: must_be_immutable
class SearchModel extends SearchEntity {
  SearchModel({
    required super.ads,
    required super.paggination,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      ads: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => AdDetailsModel.fromJsonWithDirectJson(e))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}
