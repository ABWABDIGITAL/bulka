
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferBannerCard extends StatelessWidget {
  const OfferBannerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 270.h,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/400/600'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(18.0),
            color: AppColors.offersBigCardBackground,
          ),
        );
  }
}
