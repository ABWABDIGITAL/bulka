import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  //--------------------------------------variables--------------------------------------//
  TextEditingController nameController = TextEditingController();
  String imageUrl = '';
  //--------------------------------------functions--------------------------------------//
  void initValues(
    BuildContext context,
  ) {
    nameController.text =
        context.read<MyProfileInfoCubit>().profileEntity?.fullName ?? '';
    imageUrl = context.read<MyProfileInfoCubit>().profileEntity?.avatar ?? '';
  }
  //--------------------------------------requests--------------------------------------//
}
