
import 'package:bulka/core/shared/widgets/category_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/empty/empty_widget.dart';
import 'package:bulka/modules/home/controller/cubit/home_cubit.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vSpace(20),
        HomeTitleWidget(AppStrings.exploreCategories.tr()),
        vSpace(20),
        SizedBox(
          height: 110.h,
          child: cubit.homeEntity != null
              ? (cubit.homeEntity!.categories.isEmpty
                  ? const EmptyWidget()
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: cubit.homeEntity!.categories[index],
                          isLoading: false,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 30);
                      },
                      itemCount: cubit.homeEntity!.categories.length,
                      scrollDirection: Axis.horizontal,
                    ))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return const CategoryWidget(
                      category: null,
                      isLoading: true,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 30);
                  },
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                ),
        ),
      ],
    );
  }
}
