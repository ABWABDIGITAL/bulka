import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/posts_comments/data/entity/post_comments_entity.dart';

sealed class PostCommentsState {
  const PostCommentsState();
}

final class PostCommentsInitial extends PostCommentsState {
  const PostCommentsInitial();
}

final class GetPostCommentsLoading extends PostCommentsState {
  const GetPostCommentsLoading();
}

final class GetPostCommentsSuccess extends PostCommentsState {
  final List<PostCommentsEntity> comments;
  const GetPostCommentsSuccess(this.comments);
}

final class GetPostCommentsError extends PostCommentsState {
  final ApiErrorEntity error;
  const GetPostCommentsError(this.error);
}

final class SendCommentLoading extends PostCommentsState {
  const SendCommentLoading();
}

final class SendCommentSuccess extends PostCommentsState {
  final PostCommentsEntity comment;
  const SendCommentSuccess(this.comment);
}

final class SendCommentError extends PostCommentsState {
  final ApiErrorEntity error;
  const SendCommentError(this.error);
}

final class PickerImageSuccessState extends PostCommentsState {
  const PickerImageSuccessState();
}

final class PickerImageErrorState extends PostCommentsState {
  const PickerImageErrorState();
}

final class PickedImageClearSuccessState extends PostCommentsState {
  const PickedImageClearSuccessState();
}
final class EmitTextState extends PostCommentsState {
}
