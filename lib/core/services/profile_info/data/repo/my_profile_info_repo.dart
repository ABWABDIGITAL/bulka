import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/services/profile_info/data/entity/my_profile_info_entity.dart';
import 'package:bulka/core/services/profile_info/data/model/my_profile_info_model.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:dartz/dartz.dart';

class MyProfileInfoRepo {
  const MyProfileInfoRepo();

  Future<Either<ApiErrorEntity, MyProfileInfoEntity>> profile() async {
    try {
      final response = await DioHelper.get(ApiConstance.profile);
      return Right(MyProfileInfoModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
