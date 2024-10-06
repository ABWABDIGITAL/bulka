import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/car_product_details/ui/widgets/car_product_details_images_widget.dart';
import 'package:bulka/modules/car_product_details/ui/widgets/car_product_details_included_widget.dart';
import 'package:bulka/modules/car_product_details/ui/widgets/car_product_details_main_info_widget.dart';
import 'package:bulka/modules/car_product_details/ui/widgets/car_product_details_specification_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarProductDetailsScreen extends StatelessWidget {
  const CarProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
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
      ),
    );
  }
}
