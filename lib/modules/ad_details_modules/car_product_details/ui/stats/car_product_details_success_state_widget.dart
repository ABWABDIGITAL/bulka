import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/widgets/car_product_details_images_widget.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/widgets/car_product_details_included_widget.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/widgets/car_product_details_main_info_widget.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/widgets/car_product_details_specification_widget.dart';
import 'package:flutter/material.dart';

class CarProductDetailsSuccessStateWidget extends StatelessWidget {
  const CarProductDetailsSuccessStateWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CarProductDetailsImagesWidget(),
          const CarProductDetailsSpecificationWidget(),
          vSpace(20),
          const CarProductDetailsMainInfoWidget(),
          vSpace(16),
          const CarProductDetailsIncludedWidget(),
        ],
      ),
    );
  }
}
