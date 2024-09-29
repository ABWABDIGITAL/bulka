import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:bulka/modules/choose_interests/data/entity/send_interests_entity.dart';
import 'package:bulka/modules/choose_interests/data/model/interests_model.dart';
import 'package:bulka/modules/choose_interests/data/model/send_interests_model.dart';
import 'package:bulka/modules/choose_interests/data/params/send_interests_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InterestsRepo extends Equatable {
  const InterestsRepo();
  Future<Either<ApiErrorEntity, List<InterestsEntity>>> getInterests() async {
    try {
      final response = await DioHelper.get(ApiConstance.interests);

      final List<InterestsEntity> data = checkFromArray(response.data['data'])
          ? (response.data['data'] as List)
              .map((e) => InterestsModel.fromJson(e))
              .toList()
          : [];

      return Right(data);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, SendInterestsEntity>> sendInterestsData(
      SendInterestsParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.updateInterests,
        data: params.returnedMap(),
      );
      return Right(SendInterestsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
