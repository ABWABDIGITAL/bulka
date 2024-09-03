import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/abstractions/account_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyImageWidget extends StatelessWidget {
  const VerifyImageWidget({
    super.key,
    required this.accountVerification,
  });
  final AccountVerification accountVerification;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            accountVerification.imagePath,
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
