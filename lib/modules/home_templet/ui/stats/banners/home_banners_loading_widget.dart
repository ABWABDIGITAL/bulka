import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannersLoadingWidget extends StatelessWidget {
  const HomeBannersLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ShimmerContainerWidget(
        height: 120.h,
        borderRadiusValue: 8.r,
      ),
    );
  }
}
