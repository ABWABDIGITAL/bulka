import 'package:bulka/core/shared/widgets/post_card_widget.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPostsSuccessStateWidget extends StatefulWidget {
  const GetPostsSuccessStateWidget({super.key});
  @override
  State<GetPostsSuccessStateWidget> createState() =>
      _GetPostsSuccessStateWidgetState();
}

class _GetPostsSuccessStateWidgetState
    extends State<GetPostsSuccessStateWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<PostsCubit>();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        if (cubit.postsEntity != null &&
            cubit.postsEntity!.paggination.lastPage >= cubit.page) {
          cubit.page++;
          cubit.getPostsStatesHandled();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostsCubit>();
    return ListView.builder(
      itemBuilder: (context, index) {
        return PostCardWidget(post: cubit.postsEntity!.posts[index]);
      },
      itemCount: cubit.postsEntity!.posts.length,
    );
    // return CustomScrollView(
    //   controller: scrollController,
    //   slivers: [
    //     SliverGrid.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         childAspectRatio: 1,
    //         mainAxisSpacing: 15,
    //         crossAxisSpacing: 15,
    //       ),
    //       itemCount: cubit.postsEntity!.posts.length,
    //       itemBuilder: (context, index) {
    //         return getSuitableProductDetailsByType(
    //           context: context,
    //           mainInfo:
    //               cubit.postsEntity!.posts[index].adDetailsEntity.mainInfo,
    //           postDetailsEntity: cubit.postsEntity!.posts[index],
    //         );
    //       },
    //     ),
    //   ],
    // );
  }
}


// class GetPostsSuccessStateWidget extends StatelessWidget {
//   const GetPostsSuccessStateWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return const PostCardWidget();
//       },
//       itemCount: 10,
//     );
//   }
// }
