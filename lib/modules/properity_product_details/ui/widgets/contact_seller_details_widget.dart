import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/properity_product_details/ui/widgets/properity_product_details_container_design_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactSellerDetailsWidget extends StatelessWidget {
  const ContactSellerDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.contactSeller.tr(),
          style: TextStyles.rubik16W700Black,
        ),
        vSpace(16),
        ProperityProductDetailsContainerDesignWidget(
            child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1724963335855-93f74796d4bc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNDd8fHxlbnwwfHx8fHw%3D',
              ),
            ),
            hSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'h p real estate',
                  style: TextStyles.rubik14W700Black,
                ),
                Text(
                  'agent / +91-99620xxxxx',
                  style: TextStyles.rubik12W600MediumGrey12,
                ),
              ],
            )
          ],
        )),
      ],
    );
  }
}
