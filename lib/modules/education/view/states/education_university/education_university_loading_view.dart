import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';

class GetEducationUniversityLoadingView extends StatelessWidget {
  const GetEducationUniversityLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerContainerWidget(
      width: MediaQuery.sizeOf(context).width,
      height: 48,
    );
  }
}
