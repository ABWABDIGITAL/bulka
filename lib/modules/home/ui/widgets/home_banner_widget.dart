import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/home/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({
    super.key,
    required this.isLoading,
  });
  final bool isLoading;
  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    int? bannerLength = cubit.homeEntity?.sliders.length;
    return widget.isLoading
        ? Column(
            children: [
              vSpace(10),
              if (cubit.homeEntity == null)
                const ShimmerContainerWidget(height: 180),
            ],
          )
        : Column(
            children: [
              vSpace(10),
              SharedCarousalWidget(
                itemBuilder: (context, index, reelIndex) => ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: DefaultNetworkImage(
                    cubit.homeEntity!.sliders[index].image,
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
                count: bannerLength ?? 0,
              )
            ],
          );
  }
}
