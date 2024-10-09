import 'dart:io';

import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/edit_profile/data/params/edit_profile_params.dart';
import 'package:bulka/modules/edit_profile/data/repo/edit_profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileRepo) : super(EditProfileInitial());
  //--------------------------------------variables--------------------------------------//
  final EditProfileRepo _editProfileRepo;
  TextEditingController nameController = TextEditingController();
  File? image;

  //--------------------------------------functions--------------------------------------//
  void initValues(
    BuildContext context,
  ) {
    nameController.text =
        context.read<MyProfileInfoCubit>().profileEntity?.fullName ?? '';
  }

  //--------------------------------------requests--------------------------------------//
  Future<void> editUserProfile() async {
    emit(EditProfileLoading());
   
    Map<String, dynamic> data = image == null
        ? {}
        : {
            'image': MultipartFile.fromFileSync(
              image!.path,
              filename: image!.path.split("/").last,
            )
          };

    final params = EditProfileParams(
      fullName: nameController.text,
      avatar: data.isEmpty ? null : data['image'],
    );

    await _editProfileRepo
        .editProfile(FormData.fromMap(params.toMap()))
        .then((value) {
      value.fold(
        (error) => emit(EditProfileError(error)),
        (success) {
          emit(const EditProfileLoaded());
        },
      );
    });
  }
}