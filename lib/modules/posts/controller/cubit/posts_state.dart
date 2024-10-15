import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/posts/data/entity/post_react_entity.dart';
import 'package:bulka/modules/posts/data/entity/post_save_entity.dart';
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

final class SavePostLoading extends PostsState {
  const SavePostLoading();
}

final class SavePostSuccess extends PostsState {
  final PostSaveEntity postSaveEntity;
  const SavePostSuccess(this.postSaveEntity);
}

final class SavePostError extends PostsState {
  final ApiErrorEntity error;
  const SavePostError(this.error);
}

final class ToggleReactLoading extends PostsState {
  const ToggleReactLoading();
}

final class ToggleReactSuccess extends PostsState {
  final PostReactEntity postReactEntity;
  const ToggleReactSuccess(this.postReactEntity);
}

final class ToggleReactError extends PostsState {
  final ApiErrorEntity error;
  const ToggleReactError(this.error);
}
