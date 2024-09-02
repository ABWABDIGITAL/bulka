import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/company_register/data/entity/company_reigster_entity.dart';
import 'package:bulka/modules/company_register/data/model/company_register_model.dart';
import 'package:bulka/modules/company_register/data/params/company_register_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CompanyRegisterRepo extends Equatable {
  const CompanyRegisterRepo();

  Future<Either<ApiErrorEntity, CompanyRegisterEntity>> register(
      CompanyRegisterParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.companyRegister,
        data: params.returnedMap(),
      );
      return Right(CompanyRegisterModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
