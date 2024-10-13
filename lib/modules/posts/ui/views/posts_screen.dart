import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/components/pagination_loading.dart';
import 'package:bulka/core/shared/widgets/post_card_widget.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_cubit.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_state.dart';
import 'package:bulka/modules/posts/ui/stats/get_posts_error_state_widget.dart';
import 'package:bulka/modules/posts/ui/stats/get_posts_loading_state_widget.dart';
import 'package:bulka/modules/posts/ui/stats/get_posts_success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(sl())..getPostsStatesHandled(),
      child: BlocBuilder<PostsCubit, PostsState>(
        buildWhen: (previous, current) =>
            current is GetPostsLoading ||
            current is GetPostsSuccess ||
            current is GetPostsError,
        builder: (context, state) {
          final cubit = context.read<PostsCubit>();

          if (state is GetPostsLoading) {
            if (cubit.postsEntity == null) {
              return const GetPostsLoadingStateWidget();
            } else {
              const Column(
                children: [
                  Expanded(child: GetPostsSuccessStateWidget()),
                  PagginationLoadingWidget(),
                ],
              );
            }
          }

          if (state is GetPostsError) {
            return GetPostsErrorStateWidget(state.error);
          }
          if (state is GetPostsSuccess) {
            return const GetPostsSuccessStateWidget();
          }
          return Text('no state provided');
        },
      ),
    );
  }
}
