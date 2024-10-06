import 'package:bulka/core/shared/widgets/product_details_cards/jop_card_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/home/data/entity/home_product_entity.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeJopsSectionWidget extends StatelessWidget {
  const HomeJopsSectionWidget({
    super.key,
    required this.isLoading,
    required this.products,
  });
  final bool isLoading;
  final List<HomeProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitleWidget(
                AppStrings.jops.tr(),
                onPressed: () {},
              ),
              SizedBox(
                height: 185.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return JopCardWidget(
                      width: 180.w,
                      height: 185.h,
                      isLoading: true,
                      info: products[index].mainInformation,
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
