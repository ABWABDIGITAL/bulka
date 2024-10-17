import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferBannerCardLoadingView extends StatelessWidget {
  const OfferBannerCardLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerContainerWidget(
      width: MediaQuery.sizeOf(context).width,
      height: 270.h,
    );
  }
}
