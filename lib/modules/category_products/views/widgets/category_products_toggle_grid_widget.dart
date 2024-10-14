import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_cubit.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsToggleGridWidget extends StatelessWidget {
  const CategoryProductsToggleGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoryProductsCubit>();
    const height = 30.0;
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      buildWhen: (previous, current) => current is ChangeDisplay,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.iconGrey, width: .5),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        cubit.changeDisplayType(
                            CategoryProductsDisplayTypes.grid);
                      },
                      child: Container(
                        height: height,
                        decoration: BoxDecoration(
                          color: cubit.displayType ==
                                  CategoryProductsDisplayTypes.grid
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: const BorderRadiusDirectional.only(
                            topStart: Radius.circular(25),
                            bottomStart: Radius.circular(25),
                          ),
                        ),
                        child: Icon(
                          Icons.grid_view,
                          color: cubit.displayType ==
                                  CategoryProductsDisplayTypes.grid
                              ? AppColors.white
                              : AppColors.iconGrey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: height,
                    color: AppColors.iconGrey,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        cubit.changeDisplayType(
                            CategoryProductsDisplayTypes.list);
                      },
                      child: Container(
                        height: height,
                        decoration: BoxDecoration(
                          color: cubit.displayType ==
                                  CategoryProductsDisplayTypes.list
                              ? AppColors.primary
                              : AppColors.white,
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25),
                            bottomEnd: Radius.circular(25),
                          ),
                        ),
                        child: Icon(
                          Icons.list,
                          color: cubit.displayType ==
                                  CategoryProductsDisplayTypes.list
                              ? AppColors.white
                              : AppColors.iconGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
