import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/modules/posts_comments/data/entity/post_comments_entity.dart';

class PostCommentsModel extends PostCommentsEntity {
  const PostCommentsModel({
    required super.id,
    required super.description,
    required super.totalReact,
    required super.commentType,
    required super.createdAt,
    required super.commentAttahment,
    required super.userId,
    required super.userFullName,
    required super.userAvater,
  });

  factory PostCommentsModel.fromJson(Map<String, dynamic> json) {
    return PostCommentsModel(
      id: json['id'],
      description: json['description'] ?? "",
      totalReact: json['total_react'],
      commentType: EnumSwitchReturn.getCommentType(json['comment_type']),
      createdAt: json['created_at'],
      commentAttahment: json['comment_attachment'],
      userId: json['user']['id'],
      userFullName: json['user']['full_name'],
      userAvater: json['user']['avatar'],
    );
  }
}
