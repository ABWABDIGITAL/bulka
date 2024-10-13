import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/posts/data/entity/posts_entity.dart';

sealed class PostsState {
  const PostsState();
}

final class PostsInitial extends PostsState {}

final class GetPostsLoading extends PostsState {
  const GetPostsLoading();
}

final class GetPostsSuccess extends PostsState {
  final PostsEntity postsEntity;
  const GetPostsSuccess(this.postsEntity);
}

final class GetPostsError extends PostsState {
  final ApiErrorEntity error;
  const GetPostsError(this.error);
}
