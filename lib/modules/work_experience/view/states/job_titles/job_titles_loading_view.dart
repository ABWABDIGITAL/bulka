import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';

class GetJobTitlesLoadingView extends StatelessWidget {
  const GetJobTitlesLoadingView({
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
