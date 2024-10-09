import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SharedCarousalWidget extends StatefulWidget {
  const SharedCarousalWidget({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.viewportFraction,
    this.height,
    this.onPageChanged,
    this.autoPlay = true,
    this.enlargeCenterPage = true,
    this.needCounter = false,
    this.activeImageIndex,
  });
  final Widget Function(BuildContext context, int index, int reelIndex)?
      itemBuilder;
  final Function(int activeImageIndex)? activeImageIndex;

  final int? itemCount;
  final double? height;
  final double? viewportFraction;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final bool autoPlay;
  final bool enlargeCenterPage;
  final bool needCounter;
  @override
  State<SharedCarousalWidget> createState() => _SharedCarousalWidgetState();
}

class _SharedCarousalWidgetState extends State<SharedCarousalWidget> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return widget.needCounter
        ? SizedBox(
            height: widget.height ?? 150,
            child: Column(
              children: [
                Expanded(
                  child: CarouselSlider.builder(
                    itemBuilder: widget.itemBuilder,
                    itemCount: widget.itemCount,
                    options: CarouselOptions(
                      autoPlay: widget.autoPlay,
                      enlargeCenterPage: widget.enlargeCenterPage,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      pauseAutoPlayOnManualNavigate: true,
                      pauseAutoPlayOnTouch: true,
                      viewportFraction: widget.viewportFraction ?? 1,
                      initialPage: 0,
                      height: widget.height ?? 150,
                      onPageChanged: widget.onPageChanged ??
                          (p0, p1) {
                            setState(() {
                              activeImageIndex = p0;
                            });
                            widget.activeImageIndex?.call(activeImageIndex);
                          },
                    ),
                  ),
                ),
                vSpace(10),
                CustomeSmoothIndicator(
                  activeIndex: activeImageIndex,
                  count: widget.itemCount ?? 0,
                )
              ],
            ),
          )
        : CarouselSlider.builder(
            itemBuilder: widget.itemBuilder,
            itemCount: widget.itemCount,
            options: CarouselOptions(
              autoPlay: widget.autoPlay,
              enlargeCenterPage: widget.enlargeCenterPage,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              viewportFraction: widget.viewportFraction ?? 1,
              initialPage: 0,
              height: widget.height ?? 150,
              onPageChanged: widget.onPageChanged,
            ),
          );
  }
}
