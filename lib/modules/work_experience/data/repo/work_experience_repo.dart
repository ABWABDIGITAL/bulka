import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/work_experience/data/entities/job_titles_entity.dart';
import 'package:bulka/modules/work_experience/data/models/job_title_model.dart';
import 'package:bulka/modules/work_experience/data/params/work_experience_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class WorkExperienceRepo extends Equatable {
  const WorkExperienceRepo();

  Future<Either<ApiErrorEntity, List<JobTitlesEntity>>> getJobTitles() async {
    try {
      final response = await DioHelper.get(ApiConstance.jobTitles);

      final List<JobTitlesEntity> jobTitles = (response.data['data'] as List)
          .map((e) => JobTitleModel.fromJson(e))
          .toList();
      return Right(jobTitles);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  Future<Either<ApiErrorEntity, String>> postWorkExperience(WorkExperienceParams body) async {
    try {
      final response = await DioHelper.post(ApiConstance.workExperience,data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
