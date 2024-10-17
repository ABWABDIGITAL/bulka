import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_cubit.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_state.dart';
import 'package:bulka/modules/category_products/views/widgets/category_products_toggle_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsSuccessStateWidget extends StatefulWidget {
  const CategoryProductsSuccessStateWidget({super.key});

  @override
  State<CategoryProductsSuccessStateWidget> createState() =>
      _CategoryProductsSuccessStateWidgetState();
}

class _CategoryProductsSuccessStateWidgetState
    extends State<CategoryProductsSuccessStateWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CategoryProductsCubit>();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        if (cubit.categoryProductsEntity != null &&
            cubit.categoryProductsEntity!.paggination.lastPage >= cubit.page) {
          cubit.page++;
          cubit.categoryProductsStatesHandled();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryProductsCubit>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
        buildWhen: (previous, current) => current is ChangeDisplay,
        builder: (context, state) {
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverToBoxAdapter(
                  child: CategoryProductsToggleGridWidget()),
              SliverToBoxAdapter(child: vSpace(10)),
              SliverGrid.builder(
                gridDelegate: cubit.gridDelegate(context),
                itemCount: cubit.categoryProductsEntity!.ads.length,
                itemBuilder: (context, index) {
                  return getSuitableProductDetailsByType(
                    context: context,
                    mainInfo: cubit.categoryProductsEntity!.ads[index].mainInfo,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
