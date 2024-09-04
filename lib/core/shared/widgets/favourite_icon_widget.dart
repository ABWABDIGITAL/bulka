import 'package:bulka/core/assets/asset_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetIcons.likeSvg,
      width: 15.w,
      height: 15.h,
    );
  }
}
