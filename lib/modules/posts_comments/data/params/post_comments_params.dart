import 'package:equatable/equatable.dart';

class PostCommentsParams extends Equatable {
  const PostCommentsParams({required this.postId});
  final int postId;

  @override
  List<Object?> get props => [postId];
}
