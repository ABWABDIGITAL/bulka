import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPhoneImageWidget extends StatelessWidget {
  const VerifyPhoneImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            AssetIcons.verifyEmail,
            height: 130.h,
            width: 130.w,
          ),
          Image.asset(
            AssetImages.stars,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }
}
