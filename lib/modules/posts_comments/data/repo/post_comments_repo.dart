import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/posts_comments/data/entity/post_comments_entity.dart';
import 'package:bulka/modules/posts_comments/data/model/post_comments_model.dart';
import 'package:bulka/modules/posts_comments/data/params/post_comments_params.dart';
import 'package:bulka/modules/posts_comments/data/params/send_comments_params.dart';
import 'package:dartz/dartz.dart';

class PostCommentsRepo {
  const PostCommentsRepo();

  Future<Either<ApiErrorEntity, List<PostCommentsEntity>>> getPostComments(
      PostCommentsParams params) async {
    try {
      final response = await DioHelper.get(ApiConstance.postComments(params));

      final List<PostCommentsModel> comments =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => PostCommentsModel.fromJson(e))
                  .toList()
              : [];

      return Right(comments);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, PostCommentsEntity>> sendComment(
      SendCommentParams params) async {
    try {
      final data = await params.returnedMap();
      final response = await DioHelper.post(
        ApiConstance.sendComment,
        data: data,
        isFormData: true,
      );

      return Right(PostCommentsModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
