import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfferDetailsTitle extends StatelessWidget {
  const OfferDetailsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppStrings.offerDetails.tr()} :',
      style: TextStyles.rubik14W500Black,
    );
  }
}
