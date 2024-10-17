import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:flutter/material.dart';

class AllSkillsLoadingView extends StatelessWidget {
  const AllSkillsLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => ShimmerContainerWidget(
        width: MediaQuery.sizeOf(context).width,
        height: 40,
      ),
      separatorBuilder: (context, index) => vSpace(8),
      itemCount: 8,
      
    );
  }
}
