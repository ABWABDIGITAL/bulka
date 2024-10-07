import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfferDetailsButton extends StatelessWidget {
  const OfferDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(text: AppStrings.claimOffer.tr(),);
  }
}