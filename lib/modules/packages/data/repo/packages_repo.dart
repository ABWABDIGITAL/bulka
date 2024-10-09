import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/packages/data/entity/packages_entity.dart';
import 'package:bulka/modules/packages/data/entity/pay_subscribtion_entity.dart';
import 'package:bulka/modules/packages/data/entity/subscribe_entity.dart';
import 'package:bulka/modules/packages/data/model/package_model.dart';
import 'package:bulka/modules/packages/data/model/pay_subscribtion_model.dart';
import 'package:bulka/modules/packages/data/model/subscribe_model.dart';
import 'package:bulka/modules/packages/data/params/pay_subscribtion_params.dart';
import 'package:bulka/modules/packages/data/params/subscribe_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PackagesRepo extends Equatable {
  const PackagesRepo();
  Future<Either<ApiErrorEntity, List<PackagesEntity>>> packages() async {
    try {
      final response = await DioHelper.get(ApiConstance.getPackages);

      final List<PackagesEntity> data = checkFromArray(response.data['data'])
          ? (response.data['data'] as List)
              .map((e) => PackageModel.fromJson(e))
              .toList()
          : [];

      return Right(data);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, SubscribeEntity>> subscribe(
      SubscribeParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.subscribe,
        data: params.returnedMap(),
      );
      return Right(SubscribeModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, PaySubscribtionEntity>> paySubscribtion(
      PaySubscribtionParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.paySubscribtion,
        data: params.returnedMap(),
      );
      return Right(PaySubscribtionModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
