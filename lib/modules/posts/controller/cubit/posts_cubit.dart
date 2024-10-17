import 'package:bloc/bloc.dart';
import 'package:bulka/modules/posts/controller/cubit/posts_state.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:bulka/modules/posts/data/entity/posts_entity.dart';
import 'package:bulka/modules/posts/data/params/post_react_params.dart';
import 'package:bulka/modules/posts/data/params/post_save_params.dart';
import 'package:bulka/modules/posts/data/params/post_share_params.dart';
import 'package:bulka/modules/posts/data/params/posts_params.dart';
import 'package:bulka/modules/posts/data/repo/posts_repo.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo _postsRepo;
  PostsCubit(this._postsRepo) : super(PostsInitial());
//---------------------------------VARIABLES----------------------------------//
  PostsEntity? postsEntity;
  int page = 0;
//---------------------------------FUNCTIONS----------------------------------//
  void changeElementInEntity(PostDetailsEntity postEntity) {
    int foundedIndex = postsEntity!.posts.indexWhere((element) =>
        element.adDetailsEntity.mainInfo.id ==
        postEntity.adDetailsEntity.mainInfo.id);
    if (foundedIndex != -1) {
      postsEntity!.posts[foundedIndex] = postEntity;
    }
  }

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

  Future<void> savePostStatesHandled(PostSaveParams params) async {
    emit(const SavePostLoading());
    final response = await _postsRepo.savePost(params);
    response.fold((failure) {
      return emit(SavePostError(failure));
    }, (success) async {
      changeElementInEntity(success.post);

      return emit(SavePostSuccess(success));
    });
  }

  Future<void> postDetailsStatesHandled(PostSaveParams params) async {
    emit(const SavePostLoading());
    final response = await _postsRepo.savePost(params);
    response.fold((failure) {
      return emit(SavePostError(failure));
    }, (success) async {
      return emit(SavePostSuccess(success));
    });
  }

  Future<void> toggleReactOnPostStatesHandled(PostReactParams params) async {
    emit(const ToggleReactLoading());
    final response = await _postsRepo.reactOnPost(params);
    response.fold((failure) {
      return emit(ToggleReactError(failure));
    }, (success) async {
      changeElementInEntity(success.post);
      return emit(ToggleReactSuccess(success));
    });
  }

  Future<void> sharePostStatesHandled(PostShareParams params) async {
    emit(const SharePostLoading());
    final response = await _postsRepo.sharePost(params);
    response.fold((failure) {
      return emit(SharePostError(failure));
    }, (success) async {
      changeElementInEntity(success.post);
      return emit(SharePostSuccess(success));
    });
  }
}
