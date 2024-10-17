import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CvRepo extends Equatable {
  const CvRepo();

  Future<Either<ApiErrorEntity, String>> postCv(FormData body) async {
    try {
      final response =
          await DioHelper.postFormData(ApiConstance.uploadCv, data: body);
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
