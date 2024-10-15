import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/posts_comments/controller/cubit/post_comments_cubit.dart';
import 'package:bulka/modules/posts_comments/data/params/post_comments_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCommentsErrorStateWidget extends StatelessWidget {
  const PostCommentsErrorStateWidget({
    super.key,
    required this.error,
    required this.params,
  });
  final ApiErrorEntity error;
  final PostCommentsParams params;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostCommentsCubit>();

    return cubit.comments == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              cubit.postCommentsStatesHandled(params);
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              cubit.postCommentsStatesHandled(params);
            },
          );
  }
}
