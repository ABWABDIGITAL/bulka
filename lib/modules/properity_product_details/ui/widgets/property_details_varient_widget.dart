import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/properity_product_details/ui/widgets/properity_product_details_container_design_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDetailsVarientWidget extends StatelessWidget {
  const PropertyDetailsVarientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProperityProductDetailsContainerDesignWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.propertyDetails.tr(),
            style: TextStyles.rubik16W700Black,
          ),
          vSpace(20),
          Column(
            children: List.generate(
              3,
              (index) {
                return Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 16.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'type',
                          style: TextStyles.rubik14W500MediumGrey7,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Appartment',
                          style: TextStyles.rubik14W600Black,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
