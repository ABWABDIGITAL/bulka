import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsLoadingStateWidget extends StatelessWidget {
  const CategoryProductsLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryProductsCubit>();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        gridDelegate: cubit.gridDelegate(context),
        itemBuilder: (context, index) {
          return ShimmerContainerWidget(height: 220.h, width: 150.w);
        },
        itemCount: 12,
      ),
    );
  }
}
