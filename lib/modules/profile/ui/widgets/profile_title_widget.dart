import 'dart:convert';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/edit_profile/view/screens/edit_profile_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTitleWidget extends StatefulWidget {
  const ProfileTitleWidget({super.key});

  @override
  State<ProfileTitleWidget> createState() => _ProfileTitleWidgetState();
}

class _ProfileTitleWidgetState extends State<ProfileTitleWidget>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
      lowerBound: 0.7,
      upperBound: 1.7,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final cubit = context.read<MyProfileInfoCubit>();

    return SizedBox(
      height: 260.h,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Image.asset(
            AssetImages.profileBackground,
            height: 125.h,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                vSpace(16),
                InkWell(
                  onTap: () {
                          showDialog(
                            context: context,
                            
                            builder: (BuildContext context) {
                              return const EditProfileDialog();
                            },
                          );
                        },
                        borderRadius: BorderRadius.circular(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cubit.profileEntity?.fullName ?? 'no name',
                        style: TextStyles.rubik16W500Black2,
                      ),
                      hSpace(8),
                      CircleAvatar(
                        radius: 15.r,
                        backgroundColor: AppColors.primary,
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                ),
                vSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetIcons.verifySvg,
                      height: 22.h,
                      width: 22.w,
                    ),
                    hSpace(10),
                    Text(
                      AppStrings.verified.tr(),
                      style: TextStyles.rubik13W500Green2,
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: AnimatedBuilder(
              animation: _fadeController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeController,
                  child: ScaleTransition(
                    scale: _scaleController,
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset(AssetImages.stars),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: AnimatedBuilder(
              animation: _fadeController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeController,
                  child: Transform.flip(
                    flipY: true,
                    child: ScaleTransition(
                      scale: _scaleController,
                      child: Image.asset(AssetImages.stars),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
