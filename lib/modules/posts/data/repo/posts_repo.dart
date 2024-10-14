import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/posts/data/entity/posts_entity.dart';
import 'package:bulka/modules/posts/data/models/posts_model.dart';
import 'package:bulka/modules/posts/data/params/posts_params.dart';
import 'package:dartz/dartz.dart';

class PostsRepo {
  const PostsRepo();

  Future<Either<ApiErrorEntity, PostsEntity>> posts(PostsParams params) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.posts,
        data: params.returnedMap(),
      );

      return Right(PostsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
