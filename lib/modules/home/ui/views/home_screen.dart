import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/home/ui/widgets/car_for_sale_list_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_banner_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_categories_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_jops_section_widget.dart';
import 'package:bulka/modules/home/ui/widgets/properties_for_sale_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeCategoriesWidget(),
            const HomeBannerWidget(),
            vSpace(10),
            const PropertiesForSaleListWidget(),
            vSpace(10),
            const CarForSaleListWidget(),
            vSpace(10),
            const HomeJopsSectionWidget(),
          ],
        ),
      ),
    );
  }
}
