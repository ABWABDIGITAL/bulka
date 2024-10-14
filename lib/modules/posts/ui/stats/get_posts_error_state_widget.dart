import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPostsErrorStateWidget extends StatelessWidget {
  const GetPostsErrorStateWidget(this.error, {super.key});
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostsCubit>();

    return cubit.postsEntity == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              cubit.getPostsStatesHandled();
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              cubit.getPostsStatesHandled();
            },
          );
  }
}
