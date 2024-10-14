import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class PostCommentsState {
  const PostCommentsState();
}

final class PostCommentsInitial extends PostCommentsState {
  const PostCommentsInitial();
}

final class GetPostCommentsLoading extends PostCommentsState {}

final class GetPostCommentsSuccess extends PostCommentsState {}

final class GetPostCommentsError extends PostCommentsState {
  final ApiErrorEntity error;
  const GetPostCommentsError(this.error);
}
