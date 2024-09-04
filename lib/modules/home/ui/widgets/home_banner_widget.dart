import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({super.key});

  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    const int bannerLength = 3;
    return Column(
      children: [
        vSpace(10),
        SharedCarousalWidget(
          itemBuilder: (context, index, reelIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: DefaultNetworkImage(
              'https://img.freepik.com/premium-photo/sleek-blue-sedan-sports-car-against-solid-color-background_1021867-109193.jpg?w=1380',
              fit: BoxFit.cover,
            ),
          ),
          itemCount: bannerLength,
          height: 180.h,
          onPageChanged: (p0, p1) {
            setState(() {
              activeImageIndex = p0;
            });
          },
        ),
        vSpace(10),
        CustomeSmoothIndicator(
          activeIndex: activeImageIndex,
          count: bannerLength,
        )
      ],
    );
  }
}
