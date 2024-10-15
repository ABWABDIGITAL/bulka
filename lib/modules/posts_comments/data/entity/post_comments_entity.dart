import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class PostCommentsEntity extends Equatable {
  const PostCommentsEntity({
    required this.id,
    required this.description,
    required this.totalReact,
    required this.commentType,
    required this.createdAt,
    required this.commentAttahment,
    required this.userId,
    required this.userFullName,
    required this.userAvater,
  });
  final int id;
  final String description;
  final num? totalReact;
  final CommentType commentType;
  final String? commentAttahment;
  final String createdAt;
  final int userId;
  final String userFullName;
  final String? userAvater;

  @override
  List<Object?> get props => [
        id,
        description,
        totalReact,
        commentType,
        commentAttahment,
        createdAt,
        userId,
        userFullName,
        userAvater
      ];
}
