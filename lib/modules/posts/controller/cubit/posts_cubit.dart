import 'package:bloc/bloc.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_state.dart';
import 'package:bulka/modules/posts/data/entity/posts_entity.dart';
import 'package:bulka/modules/posts/data/params/posts_params.dart';
import 'package:bulka/modules/posts/data/repo/posts_repo.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;
  PostsCubit(this._postsRepo) : super(PostsInitial());
//---------------------------------VARIABLES----------------------------------//
  PostsEntity? postsEntity;
  int page = 0;
//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> getPostsStatesHandled() async {
    emit(const GetPostsLoading());
    final response = await _postsRepo.posts(PostsParams(page: page));
    response.fold((failure) {
      return emit(GetPostsError(failure));
    }, (success) async {
      if (postsEntity == null) {
        postsEntity = success;
      } else {
        postsEntity!.paggination = success.paggination;
        if (success.posts.isNotEmpty) {
          success.posts.map((e) => postsEntity!.posts.add(e)).toList();
        }
      }
      return emit(GetPostsSuccess(success));
    });
  }
}
