import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/faq/data/entities/faq_entity.dart';
import 'package:bulka/modules/faq/data/models/faq_model.dart';
import 'package:dartz/dartz.dart';

class FaqRepo {
  const FaqRepo();

  Future<Either<ApiErrorEntity, List<FaqEntity>>> getFaqs() async {
    try {
      final response =await DioHelper.get(ApiConstance.faq);
      return  Right((response.data['data'] as List)
          .map((e) => FaqModel.fromJson(e))
          .toList());
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
