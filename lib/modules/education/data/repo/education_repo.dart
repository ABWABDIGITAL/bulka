import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/education/data/entities/education_degree_entity.dart';
import 'package:bulka/modules/education/data/models/education_degree_model.dart';
import 'package:bulka/modules/education/data/params/education_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EducationRepo extends Equatable{
  const EducationRepo();
 Future<Either<ApiErrorEntity, List<EducationDegreeEntity>>> getEducationDegree() async {
    try {
      final response = await DioHelper.get(ApiConstance.educationDegree);

      final List<EducationDegreeEntity> educationDegree = (response.data['data'] as List)
          .map((e) => EducationDegreeModel.fromJson(e))
          .toList();
      return Right(educationDegree);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  Future<Either<ApiErrorEntity, String>> postEducation(EducationParams body) async {
    try {
      final response = await DioHelper.post(ApiConstance.education,data: body.toMap());
      return Right(response.data['message']);
    } on Exception catch (e) {
      return Left(ErrorHandler.handleError(e.toString()));
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}