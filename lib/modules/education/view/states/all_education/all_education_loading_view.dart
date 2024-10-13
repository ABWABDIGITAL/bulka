import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';

class AllEducationLoadingView extends StatelessWidget {
  const AllEducationLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => ShimmerContainerWidget(
        width: MediaQuery.sizeOf(context).width,
        height: 100,
      ),
      separatorBuilder: (context, index) => vSpace(8),
      itemCount: 3,
      
    );
  }
}
