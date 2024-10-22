import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/verify_id/data/params/verify_id_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class VerifyIdRepo extends Equatable{
  const VerifyIdRepo();

Future<Either<ApiErrorEntity, String>> postVerifyId(
      VerifyIdParams body) async {
    try {
      final params = FormData.fromMap(body.toMap());
      final response =
          await DioHelper.postFormData(ApiConstance.verifyId, data: params);

      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}