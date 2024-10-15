import 'dart:io';

import 'package:bulka/core/utils/enums/enums.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class SendCommentParams extends Equatable {
  const SendCommentParams({
    required this.postId,
    required this.description,
    required this.commentType,
    this.commentAttachment,
  });
  final int postId;
  final String description;
  final CommentType commentType;
  final File? commentAttachment;

  Future<Map<String, dynamic>> returnedMap() async {
    Map<String, dynamic> map = {
      "ad_id": postId,
      "description": description,
      "comment_type": commentType.name,
      "comment_attachment": commentAttachment != null
          ? await MultipartFile.fromFile(commentAttachment!.path)
          : null,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props =>
      [postId, description, commentType, commentAttachment];
}
