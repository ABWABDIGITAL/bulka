import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/support/data/params/email_support_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SupportRepo extends Equatable {
  const SupportRepo();

  Future<Either<ApiErrorEntity, String>> postEmailSupport(
      EmailSupportParams body) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.emailSupport,
        data: body.toMap(),
      );
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
