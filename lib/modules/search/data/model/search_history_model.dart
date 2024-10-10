import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/search/data/entity/search_history_entity.dart';

// ignore: must_be_immutable
class SearchHistoryModel extends SearchHistoryEntity {
  SearchHistoryModel({
    required super.data,
    required super.paggination,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryModel(
      data: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => SearchHistoryDataModel.fromJson(e))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}

class SearchHistoryDataModel extends SearchHistoryDataEntity {
  const SearchHistoryDataModel({
    required super.id,
    required super.keyWord,
    required super.category,
  });

  factory SearchHistoryDataModel.fromJson(Map<String, dynamic> json) {
    return SearchHistoryDataModel(
      id: json['id'],
      keyWord: json['key_word'],
      category: json['category'],
    );
  }
}
