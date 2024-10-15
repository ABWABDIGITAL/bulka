import 'package:bulka/modules/posts/data/entity/post_save_entity.dart';

class PostSaveModel extends PostSaveEntity {
  const PostSaveModel({required super.message});

  factory PostSaveModel.fromJson(Map<String, dynamic> json) {
    return PostSaveModel(message: json['message']);
  }
}
