import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsLoadingView extends StatelessWidget {
  const AboutUsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerContainerWidget(
      height: 300.h,
      borderRadiusValue: 12,
      width: MediaQuery.of(context).size.width,
    );
  }
}
