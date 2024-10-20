import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/user_language/data/entities/all_levels_entity.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';
import 'package:bulka/modules/user_language/data/models/all_levels_model.dart';
import 'package:bulka/modules/user_language/data/models/user_language_model.dart';
import 'package:bulka/modules/user_language/data/params/user_language_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UserLanguageRepo extends Equatable {
  const UserLanguageRepo();

  Future<Either<ApiErrorEntity, List<UserLanguageEntity>>> getUserLang() async {
    try {
      final response = await DioHelper.get(ApiConstance.userLanguage);

      final List<UserLanguageEntity> userLanguage =
          (response.data['data'] as List)
              .map((e) => UserLanguageModel.fromUserLangJson(e))
              .toList();
      return Right(userLanguage);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<ApiErrorEntity, List<UserLanguageEntity>>> getAllLang() async {
    try {
      final response = await DioHelper.get(ApiConstance.allLanguages);

      final List<UserLanguageEntity> allLanguage =
          (response.data['data'] as List)
              .map((e) => UserLanguageModel.fromLangJson(e))
              .toList();
      return Right(allLanguage);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<ApiErrorEntity, List<AllLevelsEntity>>> getAllLevels(
      int langId) async {
    try {
      final response =
          await DioHelper.get(ApiConstance.allLevels + langId.toString());

      final List<AllLevelsEntity> allLevels = (response.data['data'] as List)
          .map((e) => AllLevelsModel.fromJson(e))
          .toList();
      return Right(allLevels);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<ApiErrorEntity, String>> postUserLanguage(
      UserLanguageParams body) async {
    try {
      final response =
          await DioHelper.post(ApiConstance.userLanguage, data: body.toMap());

      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(
        ErrorHandler.handleError(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<ApiErrorEntity, String>> deleteUserLanguage(int langId) async {
    try {
      final response =
          await DioHelper.delet(ApiConstance.deleteLanguage + langId.toString());

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
