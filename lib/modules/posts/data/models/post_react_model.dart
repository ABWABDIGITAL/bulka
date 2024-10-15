import 'package:bulka/modules/posts/data/entity/post_react_entity.dart';
import 'package:bulka/modules/posts/data/models/post_details_model.dart';

class PostReactModel extends PostReactEntity {
  const PostReactModel({
    required super.message,
    required super.post,
  });

  factory PostReactModel.fromJson(Map<String, dynamic> json) {
    return PostReactModel(
      message: json['message'],
      post: PostDetailsModel.fromJson(json['data']),
    );
  }
}
