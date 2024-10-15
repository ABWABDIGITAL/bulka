import 'package:bulka/core/assets/asset_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileChangePasswordAnimatedHeadphoneSparkle extends StatefulWidget {
  const ProfileChangePasswordAnimatedHeadphoneSparkle({super.key});

  @override
  State<ProfileChangePasswordAnimatedHeadphoneSparkle> createState() =>
      _ProfileChangePasswordAnimatedHeadphoneSparkleState();
}

class _ProfileChangePasswordAnimatedHeadphoneSparkleState
    extends State<ProfileChangePasswordAnimatedHeadphoneSparkle>
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
    return SizedBox(
      height: 170.h,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Center(
            child: Image.asset(
              AssetImages.changePassword,
              height: 125.h,
              //    width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
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
