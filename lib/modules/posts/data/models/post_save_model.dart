import 'package:bulka/modules/posts/data/entity/post_save_entity.dart';
import 'package:bulka/modules/posts/data/models/post_details_model.dart';

class PostSaveModel extends PostSaveEntity {
  const PostSaveModel({
    required super.message,
    required super.post,
  });

  factory PostSaveModel.fromJson(Map<String, dynamic> json) {
    return PostSaveModel(
      message: json['message'],
      post: PostDetailsModel.fromJson(json['data']),
    );
  }
}
