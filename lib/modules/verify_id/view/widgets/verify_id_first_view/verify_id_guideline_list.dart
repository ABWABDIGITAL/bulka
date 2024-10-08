import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_first_view/verify_id_guideline_check_first_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifyIdGuidelineList extends StatelessWidget {
  const VerifyIdGuidelineList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> text = [
      AppStrings.governmentIssued.tr(),
      AppStrings.originalFullSizeUneditedDocuments.tr(),
      AppStrings.documentsAgainstASingleColorBackground.tr(),
      AppStrings.readableWellLitColoredImages.tr(),
      AppStrings.noBlackAndWhiteImages.tr(),
      AppStrings.noEditedOrExpiredDocuments.tr(),
    ];
    return Column(
      children: List.generate(
        text.length,
        (index) => VerifyIdGuidelineCheckFirstView(text: text[index]),
      ),
    );
  }
}
