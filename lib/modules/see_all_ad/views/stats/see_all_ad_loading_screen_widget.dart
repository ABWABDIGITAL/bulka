import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';

class SeeAllAdLoadingScreenWidget extends StatelessWidget {
  const SeeAllAdLoadingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return const ShimmerContainerWidget(
              height: 200,
            );
          },
          itemCount: 15,
        )
      ],
    );
  }
}
