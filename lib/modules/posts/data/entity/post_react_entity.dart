import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:equatable/equatable.dart';

class PostReactEntity extends Equatable {
  const PostReactEntity({
    required this.message,
    required this.post,
  });
  final String message;
  final PostDetailsEntity post;

  @override
  List<Object?> get props => [message, post];
}
