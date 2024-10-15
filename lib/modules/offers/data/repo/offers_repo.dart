import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/offers/data/entities/offers_banner_entity.dart';
import 'package:bulka/modules/offers/data/entities/offers_entity.dart';
import 'package:bulka/modules/offers/data/models/offers_banner_model.dart';
import 'package:bulka/modules/offers/data/models/offers_model.dart';
import 'package:dartz/dartz.dart';

class OffersRepo {
  const OffersRepo();

  Future<Either<ApiErrorEntity, List<OffersBannerEntity>>>
      getOffersBanner() async {
    try {
      final response = await DioHelper.get(ApiConstance.offersBanner);
      return Right(
        (response.data['data'] as List)
            .map(
              (e) => OffersBannerModel.fromJson(e),
            )
            .toList(),
      );
    } catch (error) {
      return Left(
        ErrorHandler.handleError(error),
      );
    }
  }

  Future<Either<ApiErrorEntity, List<OffersEntity>>> getOffers() async {
    try {
      final response = await DioHelper.get(ApiConstance.offers);
      return Right(
        (response.data['data'] as List)
            .map(
              (e) => OffersModel.fromJson(e),
            )
            .toList(),
      );
    } catch (error) {
      return Left(
        ErrorHandler.handleError(error),
      );
    }
  }
}
