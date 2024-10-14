import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/posts_comments/controller/cubit/post_comments_state.dart';
import 'package:bulka/modules/posts_comments/data/entity/post_comments_entity.dart';
import 'package:bulka/modules/posts_comments/data/params/post_comments_params.dart';
import 'package:bulka/modules/posts_comments/data/params/send_comments_params.dart';
import 'package:bulka/modules/posts_comments/data/repo/post_comments_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostCommentsCubit extends Cubit<PostCommentsState> {
  final PostCommentsRepo _postCommentsRepo;
  PostCommentsCubit(this._postCommentsRepo)
      : super(const PostCommentsInitial());
//---------------------------------VARIABLES----------------------------------//
  List<PostCommentsEntity>? comments;
  TextEditingController commentController = TextEditingController();
  File? diplayImage;
  XFile? pickedImage;
  int? fileSize;
//---------------------------------FUNCTIONS----------------------------------//
  void clearComment() {
    commentController.clear();
  }

  void uploadImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      diplayImage = File(pickedImage.path);
      this.pickedImage = pickedImage;
      fileSize = await diplayImage?.length();
      emit(const PickerImageSuccessState());
    } else {
      emit(const PickerImageErrorState());
    }
  }

  void clearPickedImage() {
    pickedImage = null;
    diplayImage = null;
    fileSize = null;
    emit(const PickedImageClearSuccessState());
  }

  void emitText() {
    emit(EmitTextState());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> postCommentsStatesHandled(PostCommentsParams params) async {
    emit(const GetPostCommentsLoading());
    final response = await _postCommentsRepo.getPostComments(params);
    response.fold((failure) {
      return emit(GetPostCommentsError(failure));
    }, (success) async {
      comments = success;
      return emit(GetPostCommentsSuccess(success));
    });
  }

  Future<void> sendCommentStatesHandled(int postId) async {
    emit(const SendCommentLoading());
    final response = await _postCommentsRepo.sendComment(
      SendCommentParams(
        postId: postId,
        description: commentController.text,
        commentType: diplayImage != null ? CommentType.image : CommentType.text,
        commentAttachment: diplayImage,
      ),
    );
    response.fold((failure) {
      return emit(SendCommentError(failure));
    }, (success) async {
      clearComment();
      clearPickedImage();
      comments!.add(success);
      return emit(SendCommentSuccess(success));
    });
  }
}
