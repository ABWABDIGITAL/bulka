import 'package:bulka/core/shared/entity/paggination_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchHistoryEntity extends Equatable {
  SearchHistoryEntity({required this.data, required this.paggination});
  List<SearchHistoryDataEntity> data;
  PagginationEntity paggination;

  @override
  List<Object?> get props => [data, paggination];
}

class SearchHistoryDataEntity extends Equatable {
  const SearchHistoryDataEntity({
    required this.id,
    required this.keyWord,
    required this.category,
  });
  final int id;
  final String keyWord;
  final dynamic category;

  @override
  List<Object?> get props => [id, keyWord, category];
}
