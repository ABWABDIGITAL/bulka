import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/authentication/verify_account/data/entity/verify_account_entity.dart';
import 'package:bulka/modules/authentication/verify_account/data/model/verify_account_model.dart';
import 'package:bulka/modules/authentication/verify_account/data/params/verift_account_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class VerifyAccountRepo extends Equatable {
  const VerifyAccountRepo();

  Future<Either<ApiErrorEntity, VerifyAccountEntity>> verify(
      VeriftAccountParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.verifyAccount,
        data: params.returnedMap(),
      );
      return Right(VerifyAccountModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
