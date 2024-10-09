import 'dart:developer';

import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/create_ad/data/entity/buying_ad_entity.dart';
import 'package:bulka/modules/create_ad/data/entity/create_ad_entity.dart';
import 'package:bulka/modules/create_ad/data/model/buying_ad_model.dart';
import 'package:bulka/modules/create_ad/data/model/create_ad_model.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CreateAdRepo {
  const CreateAdRepo();

  Future<Either<ApiErrorEntity, CreateAdEntity>> createAd(
      CreateAdParams params) async {
    try {
      final FormData formData = await params.returnFormData();

      final response = await DioHelper.postFormData(
        ApiConstance.createAd,
        data: formData,
      );

      return Right(CreateAdModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, BuyingAdEntity>> buyingAdDetails() async {
    try {
      final response = await DioHelper.get(ApiConstance.buyingAd);

      return Right(BuyingAdModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
