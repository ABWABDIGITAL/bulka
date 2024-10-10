import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/components/pagination_loading.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_cubit.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_state.dart';
import 'package:bulka/modules/category_products/data/params/category_products_params.dart';
import 'package:bulka/modules/category_products/views/stats/category_products_error_state_widget.dart';
import 'package:bulka/modules/category_products/views/stats/category_products_loading_state_widget.dart';
import 'package:bulka/modules/category_products/views/stats/category_products_success_state_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    super.key,
    required this.categoryId,
  });
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryProductsCubit(sl(), categoryId)
        ..categoryProductsStatesHandled(),
      child: Scaffold(
        appBar: const HomeAppbarWidget(),
        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          buildWhen: (previous, current) =>
              current is CategoryProductsLoading ||
              current is CategoryProductsSuccess ||
              current is CategoryProductsError ||
              current is ChangeDisplay,
          builder: (context, state) {
            final cubit = context.read<CategoryProductsCubit>();
            final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.returnValueAdjustResponsive(
                  context, 6, 5, 4, 3, 2),
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 0.7,
            );

            if (state is CategoryProductsLoading) {
              if (cubit.categoryProductsEntity == null) {
                return const CategoryProductsLoadingStateWidget();
              } else {
                const Column(
                  children: [
                    Expanded(child: CategoryProductsSuccessStateWidget()),
                    PagginationLoadingWidget(),
                  ],
                );
              }
            }

            if (cubit.categoryProductsEntity != null ||
                state is CategoryProductsSuccess) {
              return cubit.categoryProductsEntity!.ads.isEmpty
                  ? Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'No Result Found',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : const CategoryProductsSuccessStateWidget();
            }

            if (state is CategoryProductsError) {
              return CategoryProductsErrorStateWidget(error: state.error);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
