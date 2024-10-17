import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class PostDetailsEntity extends Equatable {
  const PostDetailsEntity({
    required this.adDetailsEntity,
    required this.comment,
    required this.commentsCount,
    required this.totalReact,
    required this.sharedCount,
    required this.isReacted,
    required this.isSaved,
    required this.reaction,
  });
  final AdDetailsEntity adDetailsEntity;
  final List<dynamic> comment;
  final num commentsCount;
  final num totalReact;
  final ReactionTypes? reaction;
  final num sharedCount;
  final bool isReacted;
  final bool isSaved;

  @override
  List<Object?> get props => [
        adDetailsEntity,
        comment,
        commentsCount,
        totalReact,
        reaction,
        sharedCount,
        isReacted,
        isSaved
      ];
}
