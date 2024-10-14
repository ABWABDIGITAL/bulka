import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/search/data/entity/search_entity.dart';
import 'package:bulka/modules/search/data/entity/search_history_entity.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {}

final class AddSearchText extends SearchState {}

final class SearchLoading extends SearchState {
  const SearchLoading();
}

final class SearchSuccess extends SearchState {
  final SearchEntity search;
  const SearchSuccess(this.search);
}

final class SearchError extends SearchState {
  final ApiErrorEntity error;
  const SearchError(this.error);
}

final class SearchHistoryLoading extends SearchState {
  const SearchHistoryLoading();
}

final class SearchHistorySuccess extends SearchState {
  final SearchHistoryEntity history;
  const SearchHistorySuccess(this.history);
}

final class SearchHistoryError extends SearchState {
  final ApiErrorEntity error;
  const SearchHistoryError(this.error);
}
