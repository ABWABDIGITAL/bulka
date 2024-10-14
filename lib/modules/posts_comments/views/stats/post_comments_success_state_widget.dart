import 'dart:convert';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:bulka/modules/posts_comments/data/entity/post_comments_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PostCommentsSuccessStateWidget extends StatelessWidget {
  const PostCommentsSuccessStateWidget(this.comments, {super.key});
  final List<PostCommentsEntity> comments;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (comments[index].userAvater == null)
              CircleAvatar(
                backgroundColor: AppColors.white,
                child: SvgPicture.asset(
                  AssetIcons.appIconSvg,
                  height: 18.h,
                  width: 18.w,
                ),
              ),
            if (comments[index].userAvater != null)
              CircleAvatar(
                backgroundImage:
                    MemoryImage(base64Decode(comments[index].userAvater!)),
                radius: 20,
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comments[index].userFullName,
                    style: TextStyles.roboto14W600Black2,
                  ),
                  const SizedBox(height: 5),
                  if (comments[index].description != '')
                    CustomeExpandableText(
                      comments[index].description,
                      style: TextStyles.rubik10W400Black100,
                      textAlign: TextAlign.start,
                      maxLines: 4,
                    ),
                  if (comments[index].commentAttahment != null &&
                      comments[index].commentType == CommentType.image)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: DefaultNetworkImage(
                        comments[index].commentAttahment!,
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(height: 5),
                  Text(
                    timeAgo(
                        DateTime.parse(comments[index].createdAt).toLocal()),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}

class Comment extends Equatable {
  final String username;
  final String? text;
  final String? imageUrl;
  final String timestamp;
  final String avatarUrl;

  const Comment({
    required this.username,
    this.text,
    this.imageUrl,
    required this.timestamp,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [username, text, imageUrl, timestamp, avatarUrl];
}
