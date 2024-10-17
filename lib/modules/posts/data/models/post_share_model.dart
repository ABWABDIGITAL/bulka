import 'package:bulka/modules/posts/data/entity/post_share_entity.dart';
import 'package:bulka/modules/posts/data/models/post_details_model.dart';

class PostShareModel extends PostShareEntity {
  const PostShareModel({
    required super.message,
    required super.post,
  });

  factory PostShareModel.fromJson(Map<String, dynamic> json) {
    return PostShareModel(
      message: json['message'],
      post: PostDetailsModel.fromJson(json['data']),
    );
  }
}
