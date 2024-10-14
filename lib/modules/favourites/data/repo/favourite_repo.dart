import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/favourites/data/entity/toggle_favourite_entity.dart';
import 'package:bulka/modules/favourites/data/model/toggle_favourite_model.dart';
import 'package:bulka/modules/favourites/data/params/toggle_favourite_params.dart';
import 'package:dartz/dartz.dart';

class FavouriteRepo {
  const FavouriteRepo();

  Future<Either<ApiErrorEntity, ToggleFavouriteEntity>> toggle(
      ToggleFavouriteParams params) async {
    try {
      final response = await DioHelper.put(
        ApiConstance.toggleFavourite(params),
        data: params.returnedMap(),
      );

      return Right(ToggleFavouriteModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
