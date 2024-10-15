import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferBannerCardSuccessView extends StatelessWidget {
  final String image;
  const OfferBannerCardSuccessView({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 270.h,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image:  DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(18.0),
        color: AppColors.offersBigCardBackground,
      ),
    );
  }
}
