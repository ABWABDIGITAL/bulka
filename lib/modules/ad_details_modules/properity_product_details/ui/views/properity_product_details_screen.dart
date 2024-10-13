import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/ad_details_modules/properity_product_details/ui/widgets/about_properity_container_widget.dart';
import 'package:bulka/modules/ad_details_modules/properity_product_details/ui/widgets/contact_seller_details_widget.dart';
import 'package:bulka/modules/ad_details_modules/properity_product_details/ui/widgets/properity_product_details_images_widget.dart';
import 'package:bulka/modules/ad_details_modules/properity_product_details/ui/widgets/properity_product_details_main_info_widget.dart';
import 'package:bulka/modules/ad_details_modules/properity_product_details/ui/widgets/property_details_varient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProperityProductDetailsScreen extends StatelessWidget {
  const ProperityProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProperityProductDetailsImagesWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r),
              child: Column(
                children: [
                  const ProperityProductDetailsMainInfoWidget(),
                  const PropertyDetailsVarientWidget(),
                  vSpace(20),
                  const AboutProperityContainerWidget(),
                  vSpace(20),
                  const ContactSellerDetailsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
