import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/offers/view/widgets/offer_banner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersBannerWidget extends StatefulWidget {
  const OffersBannerWidget({super.key});

  @override
  State<OffersBannerWidget> createState() => _OffersBannerWidgetState();
}

class _OffersBannerWidgetState extends State<OffersBannerWidget> {
  int activeImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedCarousalWidget(
            itemBuilder: (context, index, reelIndex) => const OfferBannerCard(),
            onPageChanged: (p0, p1) {
              setState(() {
                activeImageIndex = p0;
              });
            },
            height: 270.h,
            itemCount: 3),
        vSpace(10),
        CustomeSmoothIndicator(
          activeIndex: activeImageIndex,
          count: 3,
        )
      ],
    );
  }
}
