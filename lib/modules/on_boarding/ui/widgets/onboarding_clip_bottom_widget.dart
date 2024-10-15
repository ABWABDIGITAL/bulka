import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingClipBottomWidget extends StatelessWidget {
  const OnboardingClipBottomWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipPath(
          clipper: MyOvalCustomClip(leftClip: 250, rightClip: 250),
          child: Container(
            height: 220.h,
            width: double.infinity,
            color: const Color(0xFFE3E8F2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                vSpace(30),
                Image.asset(
                  AssetIcons.fire,
                  height: 28.h,
                  width: 28.w,
                  fit: BoxFit.contain,
                ).animate(delay: 1500.ms).fadeIn(),
              ],
            ),
          ),
        ).animate().moveY(begin: 250, duration: 1000.ms),
        ClipPath(
          clipper: MyOvalCustomClip(),
          child: Container(
            height: 140.h,
            color: const Color(0xFFEAF2FF),
          ),
        ).animate().moveY(begin: 250, duration: 750.ms),
        ClipPath(
          clipper: MyOvalCustomClip(),
          child: Container(
            height: 130.h,
            color: AppColors.primary.withOpacity(.2),
          ),
        ).animate().moveY(begin: 250, duration: 500.ms),
        ClipPath(
          clipper: MyOvalCustomClip(),
          child: Container(
            height: 120.h,
            color: AppColors.primary,
            child: Center(
              child: GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  AssetIcons.upIcon,
                  height: 49.h,
                  width: 49.w,
                  fit: BoxFit.contain,
                ).animate(delay: 1500.ms).fadeIn(),
              ),
            ),
          ),
        ).animate().moveY(begin: 250, duration: 250.ms),
      ],
    );
  }
}

class MyOvalCustomClip extends CustomClipper<Path> {
  MyOvalCustomClip({this.leftClip, this.rightClip});
  final double? leftClip;
  final double? rightClip;
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, leftClip ?? 60);
    path.quadraticBezierTo(size.width / 6, 0, size.width / 2, 0);
    path.quadraticBezierTo(
        size.width - size.width / 6, 0, size.width, rightClip ?? 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
