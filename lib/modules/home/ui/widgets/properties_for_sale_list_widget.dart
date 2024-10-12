import 'package:bulka/core/shared/widgets/product_details_cards/properties_card_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/home/data/entity/home_product_entity.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:bulka/modules/see_all_ad/data/params/see_all_params.dart';
import 'package:bulka/modules/see_all_ad/views/screens/see_all_ad_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertiesForSaleListWidget extends StatelessWidget {
  const PropertiesForSaleListWidget({
    super.key,
    required this.isLoading,
    required this.product,
  });
  final bool isLoading;
  final List<HomeProductEntity> product;
  @override
  Widget build(BuildContext context) {
    return product.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitleWidget(
                AppStrings.propertiesForSale.tr(),
                onPressed: () {
                  context.push(const SeeAllAdScreen(
                      params: SeeAllParams(adType: AdType.properties)));
                },
              ),
              SizedBox(
                height: 185.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return PropertiesCardWidget(
                      width: 180.w,
                      height: 185.h,
                      info: product[index].mainInformation,
                      isLoading: isLoading,
                    );
                  },
                  itemCount: product.length,
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
