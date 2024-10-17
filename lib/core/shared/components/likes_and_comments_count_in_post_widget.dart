import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_cubit.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_state.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:bulka/modules/posts_comments/views/screens/posts_comments_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LikesAndCommentsCountInPostWidget extends StatelessWidget {
  const LikesAndCommentsCountInPostWidget(this.post, {super.key});
  final PostDetailsEntity post;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AssetIcons.emotionsSvg,
                    height: 12,
                  ),
                  hSpace(4),
                  Text(
                    '${post.totalReact.toString()} ${AppStrings.likes.tr()}',
                    style:
                        TextStyles.roboto12W400IconGrey.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(PostCommentsScreen(post));
                  },
                  child: Text(
                    '${post.commentsCount.toString()} ${AppStrings.comments.tr()}',
                    style:
                        TextStyles.roboto12W400IconGrey.copyWith(fontSize: 10),
                  ),
                ),
                hSpace(9),
                Text(
                  '${post.sharedCount.toString()} ${AppStrings.share.tr()}',
                  style: TextStyles.roboto12W400IconGrey.copyWith(fontSize: 10),
                ),
              ],
            ),
          )
        ]);
      },
    );
  }
}
