import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/faq/data/entities/faq_entity.dart';
import 'package:dartz/dartz.dart';

class FaqRepo {
  const FaqRepo();

  Future<Either<ApiErrorEntity, List<FaqEntity>>> getFaqs() async {
    try {
      //final response = DioHelper.get(ApiConstance.faq);
      return const Right([
        FaqEntity(
            answer: 'How do I create a account?',
            question:
                "You can create an account by clicking on the 'Sign Up' button and following the instructions."),
        FaqEntity(
            answer: 'How do I create a account?',
            question:
                "You can create an account by clicking on the 'Sign Up' button and following the instructions."),
        FaqEntity(
            answer: 'How do I create a account?',
            question:
                "You can create an account by clicking on the 'Sign Up' button and following the instructions."),
        FaqEntity(
            answer: 'How do I create a account?',
            question:
                "You can create an account by clicking on the 'Sign Up' button and following the instructions."),
      ] /* response['data'].map((e) => FaqModel.fromJson(e)).toList() */);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
