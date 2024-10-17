import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:bulka/modules/skills/data/models/skills_model.dart';
import 'package:bulka/modules/skills/data/params/skills_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SkillsRepo extends Equatable {
  const SkillsRepo();

  Future<Either<ApiErrorEntity, List<SkillsEntity>>> getSkills() async {
    try {
      final response = await DioHelper.get(ApiConstance.skills);

      final List<SkillsEntity> skills = (response.data['data'] as List)
          .map((e) => SkillsModel.fromSkillsJson(e))
          .toList();
      return Right(skills);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  Future<Either<ApiErrorEntity, List<SkillsEntity>>> getUserSkills() async {
    try {
      final response = await DioHelper.get(ApiConstance.userSkills);

      final List<SkillsEntity> skills = (response.data['data'] as List)
          .map((e) => SkillsModel.fromUserSkillsJson(e))
          .toList();
      return Right(skills);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  Future<Either<ApiErrorEntity, String>> postSkills(SkillsParams body) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.userSkills,
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

  Future<Either<ApiErrorEntity, String>> deleteSkills(int id) async {
    try {
      final response = await DioHelper.delet(
        '${ApiConstance.deleteSkills}/$id',
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
