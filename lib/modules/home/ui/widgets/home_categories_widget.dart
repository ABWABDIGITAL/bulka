import 'package:bulka/core/services/categories/controller/category_cubit.dart';
import 'package:bulka/core/services/categories/controller/category_state.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/category_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/empty/empty_widget.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(sl())..catgoriesStatesHandled(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpace(20),
          HomeTitleWidget(AppStrings.exploreCategories.tr()),
          vSpace(20),
          SizedBox(
            height: 110.h,
            child: BlocBuilder<CategoryCubit, CategoryState>(
              buildWhen: (previous, current) =>
                  current is GetCategoriesLoading ||
                  current is GetCategoriesSuccess ||
                  current is GetCategoriesError,
              builder: (context, state) {
                final cubit = context.read<CategoryCubit>();
                if (state is GetCategoriesError) {
                  return ErrorScreen(
                    error: state.error,
                    onPressed: () {
                      cubit.catgoriesStatesHandled();
                    },
                  );
                }

                if (state is GetCategoriesError) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return const CategoryWidget(
                        category: null,
                        isLoading: true,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 30);
                    },
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  );
                }

                if (cubit.categories != null || state is GetCategoriesSuccess) {
                  return cubit.categories!.isEmpty
                      ? const EmptyWidget()
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                              category: cubit.categories![index],
                              isLoading: false,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 30);
                          },
                          itemCount: cubit.categories!.length,
                          scrollDirection: Axis.horizontal,
                        );
                }

                return const Text('no state provided');
              },
            ),
          ),
        ],
      ),
    );
  }
}
