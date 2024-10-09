import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/handlers/image_picker_handler.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/edit_profile/controller/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileAvatar extends StatefulWidget {
  const EditProfileAvatar({
    super.key,
  });

  @override
  State<EditProfileAvatar> createState() => _EditProfileAvatarState();
}

class _EditProfileAvatarState extends State<EditProfileAvatar> {
  File? image;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyProfileInfoCubit>();
    final editProfileCubit= context.read<EditProfileCubit>();
    return Stack(
      children: [
        image != null
            ? CircleAvatar(
                radius: 50.r,
                backgroundImage: FileImage(image!),
              )
            :
        cubit.profileEntity == null || cubit.profileEntity?.avatar == null
            ? CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 50.r,
                child: SvgPicture.asset(
                  AssetIcons.appIconSvg,
                  height: 18.h,
                  width: 18.w,
                  // placeholderBuilder: (context) =>
                  //     const CircularProgressIndicator(),
                ),
              )
            : CircleAvatar(
                radius: 50.r,
                backgroundImage: MemoryImage(
                  base64Decode(cubit.profileEntity!.avatar!),
                ),
              ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: ()async {
                setState(() {
                          image = null;
                        });
                        image = await ImagePickerHandler().getSingleImage();
                        editProfileCubit.image = image;
                        log('image: ${image!.path}');
                        setState(() {});
              },
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColors.primary,
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ))
      ],
    );
  }
}
