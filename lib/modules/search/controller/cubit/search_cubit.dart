import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/widgets/debouncer_widget.dart';
import 'package:bulka/modules/search/controller/cubit/search_state.dart';
import 'package:bulka/modules/search/data/entity/search_entity.dart';
import 'package:bulka/modules/search/data/entity/search_history_entity.dart';
import 'package:bulka/modules/search/data/params/search_params.dart';
import 'package:bulka/modules/search/data/repo/search_repo.dart';
import 'package:flutter/material.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitial());
//---------------------------------VARIABLES----------------------------------//
  SearchEntity? searchEntity;
  SearchHistoryEntity? searchHistoryEntity;
  final TextEditingController search = TextEditingController();
  final Debouncer debounce = Debouncer(milliseconds: 750);
  int page = 1;
  int searchHistorypage = 1;

//---------------------------------FUNCTIONS----------------------------------//
  void addSearchText() {
    page = 1;
    searchEntity = null;
    emit(AddSearchText());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> searchStatesHandled() async {
    emit(const SearchLoading());
    final response = await _searchRepo.search(SearchParams(
      keyword: search.text,
      page: page,
    ));
    response.fold((failure) {
      return emit(SearchError(failure));
    }, (success) async {
      if (searchEntity == null) {
        searchEntity = success;
      } else {
        searchEntity!.paggination = success.paggination;
        if (success.ads.isNotEmpty) {
          success.ads.map((e) => searchEntity!.ads.add(e)).toList();
        }
      }
      return emit(SearchSuccess(success));
    });
  }

  Future<void> searchHistoryStatesHandled() async {
    emit(const SearchHistoryLoading());
    final response = await _searchRepo.searchHistory();
    response.fold((failure) {
      return emit(SearchHistoryError(failure));
    }, (success) async {
      if (searchHistoryEntity == null) {
        searchHistoryEntity = success;
      } else {
        searchHistoryEntity!.paggination = success.paggination;
        if (success.data.isNotEmpty) {
          success.data.map((e) => searchHistoryEntity!.data.add(e)).toList();
        }
      }
      return emit(SearchHistorySuccess(success));
    });
  }
}
