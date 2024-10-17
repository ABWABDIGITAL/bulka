import 'package:bulka/core/services/ad_details/data/model/ad_details_model.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';

class PostDetailsModel extends PostDetailsEntity {
  const PostDetailsModel({
    required super.adDetailsEntity,
    required super.comment,
    required super.commentsCount,
    required super.totalReact,
    required super.sharedCount,
    required super.isReacted,
    required super.isSaved,
    required super.reaction,
  });

  factory PostDetailsModel.fromJson(Map<String, dynamic> json) {
    return PostDetailsModel(
      adDetailsEntity: AdDetailsModel.fromJsonWithDirectJson(json),
      comment: checkFromArray(json['comments'])
          ? (json['comments'] as List).map((e) => e).toList()
          : [],
      commentsCount: json['comments_count'],
      totalReact: json['total_react'],
      sharedCount: json['share_count'],
      isReacted: json['is_reacted'],
      isSaved: json['is_saved'],
      reaction: EnumSwitchReturn.getReactionType(json['react_type']),
    );
  }
}
