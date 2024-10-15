import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:bulka/modules/posts/data/entity/post_react_entity.dart';
import 'package:bulka/modules/posts/data/entity/post_save_entity.dart';
import 'package:bulka/modules/posts/data/entity/posts_entity.dart';
import 'package:bulka/modules/posts/data/models/post_details_model.dart';
import 'package:bulka/modules/posts/data/models/post_react_model.dart';
import 'package:bulka/modules/posts/data/models/post_save_model.dart';
import 'package:bulka/modules/posts/data/models/posts_model.dart';
import 'package:bulka/modules/posts/data/params/post_details_params.dart';
import 'package:bulka/modules/posts/data/params/post_react_params.dart';
import 'package:bulka/modules/posts/data/params/post_save_params.dart';
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

  Future<Either<ApiErrorEntity, PostSaveEntity>> savePost(
      PostSaveParams params) async {
    try {
      final response = await DioHelper.post(ApiConstance.savePost(params));

      return Right(PostSaveModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, PostDetailsEntity>> postDetails(
      PostDetailsParams params) async {
    try {
      final response = await DioHelper.get(ApiConstance.postDetails(params));

      return Right(PostDetailsModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, PostReactEntity>> reactOnPost(
      PostReactParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.reactOnPost,
        data: params.returnedMap(),
      );

      return Right(PostReactModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
