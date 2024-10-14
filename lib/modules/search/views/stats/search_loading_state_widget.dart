import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchLoadingStateWidget extends StatelessWidget {
  const SearchLoadingStateWidget({
    super.key,
    required this.gridDelegate,
  });
  final SliverGridDelegate gridDelegate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: gridDelegate,
        itemBuilder: (context, index) {
          return ShimmerContainerWidget(height: 220.h, width: 150.w);
        },
        itemCount: 12,
      ),
    );
  }
}
