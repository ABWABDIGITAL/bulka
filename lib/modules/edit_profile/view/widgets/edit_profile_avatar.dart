import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileAvatar extends StatelessWidget {
  const EditProfileAvatar({
    super.key,
    
  });

 

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyProfileInfoCubit>();
    return Stack(
      children: [
        cubit.profileEntity == null ||
          cubit.profileEntity?.avatar == null
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
          backgroundImage:
              NetworkImage(cubit.profileEntity!.avatar!),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {},
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
