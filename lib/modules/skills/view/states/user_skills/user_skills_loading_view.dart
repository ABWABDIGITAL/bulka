import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';

class UserSkillsLoadingView extends StatelessWidget {
  const UserSkillsLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      runSpacing: 10,
      spacing: 10,
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      children: List.generate(
        9,
        (index) => const ShimmerContainerWidget(
          width: 80,
          height: 40,
        ),
      ),
    );
  }
}
