import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:equatable/equatable.dart';

class PostShareEntity extends Equatable {
  final String message;
  final PostDetailsEntity post;

  const PostShareEntity({
    required this.message,
    required this.post,
  });

  @override
  List<Object?> get props => [message, post];
}
