import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/certifications/data/params/certification_params.dart';
import 'package:dartz/dartz.dart';

class CertificationRepo {
  const CertificationRepo();

  Future<Either<ApiErrorEntity, String>> postCertification(
      CertificationParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.certification, data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }
}
