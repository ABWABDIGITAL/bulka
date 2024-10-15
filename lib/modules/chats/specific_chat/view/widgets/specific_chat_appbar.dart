import 'dart:io';

import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class SpecificChatAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const SpecificChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.white),
      leading: IconButton(
        icon: Platform.isIOS
            ? const Icon(Icons.arrow_back_ios)
            : const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: const Row(
        children: [
          // const CircleAvatar(
          //   backgroundImage: AssetImage(AppImages.patientSelect),
          //   radius: 20,
          // ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Khaled',
                // style:
                //     TextStyleHelper.medium16.copyWith(color: AppColors.white),
              ),
              Text(
                'Online',
                style: TextStyle(fontSize: 14, color: AppColors.lightGreen),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          style: IconButton.styleFrom(backgroundColor: AppColors.grey),
          icon: const Icon(Icons.usb_rounded),
          //  SvgPicture.asset(
          //   AppIcons.call,
          //   color: AppColors.white,
          // ),
          onPressed: () {},
        ),
        IconButton(
          style: IconButton.styleFrom(backgroundColor: AppColors.grey),
          icon: const Icon(
            Icons.videocam_outlined,
          ),
          onPressed: () {},
        ),
        hSpace(16)
      ],
      backgroundColor: AppColors.primary,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}
