import 'package:bulka/core/shared/entity/paggination_entity.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PostsEntity extends Equatable {
  PostsEntity({
    required this.posts,
    required this.paggination,
  });
  List<PostDetailsEntity> posts;
  PagginationEntity paggination;

  @override
  List<Object?> get props => [posts, paggination];
}
