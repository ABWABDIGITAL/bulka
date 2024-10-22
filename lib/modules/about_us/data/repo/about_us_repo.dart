import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/about_us/data/entities/about_us_entity.dart';
import 'package:bulka/modules/about_us/data/entities/terms_params.dart';
import 'package:bulka/modules/about_us/data/models/about_us_model.dart';
import 'package:bulka/modules/about_us/data/models/terms_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AboutUsRepo extends Equatable {
  const AboutUsRepo();

  Future<Either<ApiErrorEntity, List<AboutUsEntity>>> getSocialLinks() async {
    try {
      final respose = await DioHelper.get(ApiConstance.aboutUsLinks);
      return Right(
        respose.data['data']
            .map<AboutUsEntity>(
              (e) => AboutUsModel.fromJson(e),
            )
            .toList(),
      );
    } catch (e) {
      return Left(
        ErrorHandler.handleError(e),
      );
    }
  }
  Future<Either<ApiErrorEntity, List<TermsEntity>>> getTerms() async {
    try {
      final respose = await DioHelper.get(ApiConstance.terms);
      return Right(
        respose.data['data']
            .map<TermsEntity>(
              (e) => TermsModel.fromJson(e),
            )
            .toList(),
      );
    } catch (e) {
      return Left(
        ErrorHandler.handleError(e),
      );
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
