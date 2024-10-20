import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/home_templet/data/entity/banner_entity.dart';
import 'package:bulka/modules/home_templet/data/model/banner_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class HomeRepo extends Equatable {
  const HomeRepo();
  Future<Either<ApiErrorEntity, List<BannerEntity>>> homeBanners() async {
    try {
      final response = await DioHelper.get(ApiConstance.login);

      final List<BannerEntity> bannersList =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => BannerModel.fromJson(e))
                  .toList()
              : [];

      return Right(bannersList);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
