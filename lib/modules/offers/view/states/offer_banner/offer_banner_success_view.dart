import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/offers/data/entities/offers_banner_entity.dart';
import 'package:bulka/modules/offers/view/widgets/offer_banner_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersBannerSuccessView extends StatefulWidget {
  final List<OffersBannerEntity> offersBanner;
  const OffersBannerSuccessView({super.key, required this.offersBanner});

  @override
  State<OffersBannerSuccessView> createState() =>
      _OffersBannerSuccessViewState();
}

class _OffersBannerSuccessViewState extends State<OffersBannerSuccessView> {
  int activeImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedCarousalWidget(
            itemBuilder: (context, index, reelIndex) => OfferBannerCard(
                  image: widget.offersBanner[index].image,
                ),
            onPageChanged: (p0, p1) {
              setState(() {
                activeImageIndex = p0;
              });
            },
            height: 270.h,
            itemCount: widget.offersBanner.length),
        vSpace(10),
        CustomeSmoothIndicator(
          activeIndex: activeImageIndex,
          count: widget.offersBanner.length,
        )
      ],
    );
  }
}
