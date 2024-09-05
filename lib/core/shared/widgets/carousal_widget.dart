import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SharedCarousalWidget extends StatelessWidget {
  const SharedCarousalWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.viewportFraction,
    this.height,
    this.onPageChanged,
    this.autoPlay = true,
    this.enlargeCenterPage = true,
  });
  final Widget Function(BuildContext context, int index, int reelIndex)?
      itemBuilder;
  final int? itemCount;
  final double? height;
  final double? viewportFraction;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final bool autoPlay;
  final bool enlargeCenterPage;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      options: CarouselOptions(
        autoPlay: autoPlay,
        enlargeCenterPage: enlargeCenterPage,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        pauseAutoPlayOnManualNavigate: true,
        pauseAutoPlayOnTouch: true,
        viewportFraction: viewportFraction ?? 1,
        initialPage: 0,
        height: height ?? 150,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
