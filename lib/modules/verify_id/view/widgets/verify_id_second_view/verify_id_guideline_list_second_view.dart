import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_second_view/verify_id_second_view_guideline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifyIdGuidelineListSecondView extends StatelessWidget {
  const VerifyIdGuidelineListSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> text = [
      AppStrings.avoidWearingHats.tr(),
      AppStrings.avoidWearingGlasses.tr(),
      AppStrings.avoidUsingFilters.tr(),
      AppStrings.useEnoughLightings.tr(),
      
    ];
    return Column(
      children: List.generate(
        text.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: VerifyIdSecondViewGuideline(title: text[index]),
        ),
      ),
    );
  }
}
