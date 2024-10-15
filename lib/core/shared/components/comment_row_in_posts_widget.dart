import 'dart:convert';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_state.dart';
import 'package:bulka/core/shared/widgets/like_animated_react_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/core/utils/widgets/loading/adaptive_circuler.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_cubit.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_state.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:bulka/modules/posts/data/params/post_react_params.dart';
import 'package:bulka/modules/posts_comments/views/screens/posts_comments_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CommentRowInPostsWidget extends StatelessWidget {
  const CommentRowInPostsWidget(this.post, {super.key});
  final PostDetailsEntity post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocConsumer<PostsCubit, PostsState>(
          listener: (context, state) {
            if (state is ToggleReactError) {
              Dialogs.errorDialog(context: context, error: state.error);
            }
          },
          listenWhen: (previous, current) =>
              current is ToggleReactLoading ||
              current is ToggleReactSuccess ||
              current is ToggleReactError,
          buildWhen: (previous, current) =>
              current is ToggleReactLoading ||
              current is ToggleReactSuccess ||
              current is ToggleReactError,
          builder: (context, state) {
            return Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mediumGrey8,
              ),
              child: LikeAnimatedReactWidget(
                onReactionChanged: (reaction) {
                  if (state is! ToggleReactLoading) {
                    context
                        .read<PostsCubit>()
                        .toggleReactOnPostStatesHandled(PostReactParams(
                          adId: post.adDetailsEntity.mainInfo.id,
                          react: reaction,
                        ));
                  }
                },
                overlayColor: AppColors.mediumGrey8,
              ),
            );
          },
        ),
        hSpace(8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              context.push(PostCommentsScreen(post));
            },
            child: Container(
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mediumGrey8,
              ),
              child: Row(
                children: [
                  hSpace(10),
                  BlocBuilder<MyProfileInfoCubit, MyProfileInfoState>(
                    buildWhen: (previous, current) =>
                        current is MyProfileInfoLoading ||
                        current is MyProfileInfoSuccess ||
                        current is MyProfileInfoError,
                    builder: (context, state) {
                      final cubit = context.read<MyProfileInfoCubit>();
                      return cubit.profileEntity == null ||
                              cubit.profileEntity?.avatar == null
                          ? CircleAvatar(
                              backgroundColor: AppColors.white,
                              child: SvgPicture.asset(
                                AssetIcons.appIconSvg,
                                height: 18.h,
                                width: 18.w,
                              ),
                            )
                          : CircleAvatar(
                              radius: 12.r,
                              backgroundImage: MemoryImage(
                                  base64Decode(cubit.profileEntity!.avatar!)));
                    },
                  ),
                  hSpace(10),
                  Expanded(
                    child: Text(
                      AppStrings.commentHere.tr(),
                      style: TextStyles.roboto12W400IconGrey,
                    ),
                  ),
                  SvgPicture.asset(
                    AssetIcons.imageSvg,
                    height: 20.h,
                    width: 20.w,
                  ),
                  hSpace(10),
                ],
              ),
            ),
          ),
        ),
        hSpace(8),
        BlocConsumer<PostsCubit, PostsState>(
          listener: (context, state) {
            if (state is SavePostError) {
              Dialogs.errorDialog(context: context, error: state.error);
            }
            if (state is SavePostSuccess) {
              // Dialogs.errorDialog(context: context, error: state.error);
            }
          },
          listenWhen: (previous, current) =>
              current is SavePostLoading ||
              current is SavePostSuccess ||
              current is SavePostError,
          buildWhen: (previous, current) =>
              current is SavePostLoading ||
              current is SavePostSuccess ||
              current is SavePostError,
          builder: (context, state) {
            return Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.mediumGrey8,
              ),
              child: state is SavePostLoading
                  ? const AdaptiveCircularProgress()
                  : SvgPicture.asset(
                      AssetIcons.bookMarkSvg,
                      height: 20.h,
                      width: 20.w,
                    ),
            );
          },
        ),
        hSpace(8),
        Container(
          height: 40.h,
          width: 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.mediumGrey8,
          ),
          child: SvgPicture.asset(
            AssetIcons.shareSvg,
            height: 20.h,
            width: 20.w,
          ),
        ),
      ],
    );
  }
}
