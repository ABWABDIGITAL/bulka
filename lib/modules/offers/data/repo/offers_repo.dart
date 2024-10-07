import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/offers/data/entities/offers_entity.dart';
import 'package:dartz/dartz.dart';

class OffersRepo {
  const OffersRepo();

  Future<Either<ApiErrorEntity, OffersEntity>> getOffers() async {
    try {
      // final response = await DioHelper.get(ApiConstance.offers);
      // return Right(OffersModel.fromJson(response.data));
      return const Right(OffersEntity(offersSlider: [
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/300',
        'https://picsum.photos/200/300'
      ]));
    } catch (error) {
      // return Left(ErrorHandler.handleError(error));
      return Left(ErrorHandler.handleError(error));
    }
  }
}
