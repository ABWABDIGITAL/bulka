import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/components/image_varient_in_post_widget.dart';
import 'package:bulka/core/shared/components/info_details_in_post_widget.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:bulka/modules/posts_comments/controller/cubit/post_comments_cubit.dart';
import 'package:bulka/modules/posts_comments/controller/cubit/post_comments_state.dart';
import 'package:bulka/modules/posts_comments/data/params/post_comments_params.dart';
import 'package:bulka/modules/posts_comments/views/stats/post_comments_error_state_widget.dart';
import 'package:bulka/modules/posts_comments/views/stats/post_comments_loading_state_widget.dart';
import 'package:bulka/modules/posts_comments/views/stats/post_comments_success_state_widget.dart';
import 'package:bulka/modules/posts_comments/views/widgets/default_comment_form_field_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCommentsScreen extends StatelessWidget {
  const PostCommentsScreen(this.post, {super.key});
  final PostDetailsEntity post;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCommentsCubit(sl())
        ..postCommentsStatesHandled(
          PostCommentsParams(postId: post.adDetailsEntity.mainInfo.id),
        ),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: AppStrings.postComments.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<PostCommentsCubit, PostCommentsState>(
            buildWhen: (previous, current) =>
                current is GetPostCommentsLoading ||
                current is GetPostCommentsError ||
                current is GetPostCommentsSuccess ||
                current is SendCommentSuccess,
            builder: (context, state) {
              final cubit = context.read<PostCommentsCubit>();
              return Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: InfoDetailsInPostWidget(post),
                        ),
                        SliverToBoxAdapter(child: vSpace(16)),
                        SliverToBoxAdapter(
                          child: ImageVarientInPostWidget(post),
                        ),
                        if (state is GetPostCommentsSuccess ||
                            cubit.comments != null)
                          PostCommentsSuccessStateWidget(cubit.comments!),
                        if (state is GetPostCommentsLoading)
                          const SliverToBoxAdapter(
                            child: PostCommentsLoadingStateWidget(),
                          ),
                        if (state is GetPostCommentsError)
                          SliverToBoxAdapter(
                            child: PostCommentsErrorStateWidget(
                              error: state.error,
                              params: PostCommentsParams(
                                  postId: post.adDetailsEntity.mainInfo.id),
                            ),
                          ),
                      ],
                    ),
                  ),
                  DefaultCommentFormFieldWidget(post),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
