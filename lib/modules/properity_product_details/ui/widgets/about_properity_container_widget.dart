import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/properity_product_details/ui/widgets/properity_product_details_container_design_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutProperityContainerWidget extends StatelessWidget {
  const AboutProperityContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProperityProductDetailsContainerDesignWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.aboutProperty.tr(),
            style: TextStyles.rubik16W700Black,
          ),
          vSpace(20),
          Text(
            "A Residential Plot is available for sale at Madhavaram Milk Colony, Chennai. It is located in a very good area. The plot is measures 2400 Sq.ft. and priced 1.50 Cr. / negotiable/ will disclose after contact",
            style: TextStyles.rubik14W500MediumGrey7,
          )
        ],
      ),
    );
  }
}
