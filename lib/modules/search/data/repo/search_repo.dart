import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/search/data/entity/search_entity.dart';
import 'package:bulka/modules/search/data/entity/search_history_entity.dart';
import 'package:bulka/modules/search/data/model/search_history_model.dart';
import 'package:bulka/modules/search/data/model/search_model.dart';
import 'package:bulka/modules/search/data/params/search_params.dart';
import 'package:dartz/dartz.dart';

class SearchRepo {
  const SearchRepo();

  Future<Either<ApiErrorEntity, SearchEntity>> search(
      SearchParams params) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.search,
        queries: params.returnedMap(),
      );

      return Right(SearchModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, SearchHistoryEntity>> searchHistory() async {
    try {
      final response = await DioHelper.get(ApiConstance.searchHistory);

      return Right(SearchHistoryModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}