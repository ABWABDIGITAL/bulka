import 'package:bulka/core/assets/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordImageBackgroundWidget extends StatelessWidget {
  const ForgotPasswordImageBackgroundWidget({
    super.key,
    required this.imagePath,
    this.height,
  });
  final String imagePath;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height ?? MediaQuery.sizeOf(context).height * .75,
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                height: 180.h,
                width: 180.w,
              ),
              Image.asset(
                AssetImages.stars,
                fit: BoxFit.contain,
                height: 220.h,
              )
            ],
          ),
        ),
      ],
    );
  }
}
