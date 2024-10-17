import 'package:bulka/core/shared/components/comment_row_in_posts_widget.dart';
import 'package:bulka/core/shared/components/image_varient_in_post_widget.dart';
import 'package:bulka/core/shared/components/info_details_in_post_widget.dart';
import 'package:bulka/core/shared/components/likes_and_comments_count_in_post_widget.dart';
import 'package:bulka/core/shared/components/owner_details_in_post_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.post,
  });

  final PostDetailsEntity post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OwnerDetailsInPostWidget(post),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              InfoDetailsInPostWidget(post),
              vSpace(16),
              ImageVarientInPostWidget(post),
              vSpace(16),
              LikesAndCommentsCountInPostWidget(post),
              vSpace(23),
              CommentRowInPostsWidget(post),
            ],
          ),
        )
      ],
    );
  }
}
