import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/home/controller/cubit/home_cubit.dart';
import 'package:bulka/modules/home/ui/widgets/car_for_sale_list_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_banner_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_categories_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_jops_section_widget.dart';
import 'package:bulka/modules/home/ui/widgets/properties_for_sale_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSuccessWidget extends StatelessWidget {
  const HomeSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeCategoriesWidget(),
          const HomeBannerWidget(isLoading: false),
          vSpace(10),
          PropertiesForSaleListWidget(
            product: cubit.homeEntity!.properties,
            isLoading: false,
          ),
          vSpace(10),
          CarForSaleListWidget(
            products: cubit.homeEntity!.cars,
            isLoading: false,
          ),
          vSpace(10),
          HomeJopsSectionWidget(
            products: cubit.homeEntity!.jobs,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
