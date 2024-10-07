import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/faq/data/entities/faq_entity.dart';
import 'package:bulka/modules/faq/ui/widgets/faq_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FaqEntity> faqItems = [
      const FaqEntity(
          question: "How do I create a account?",
          answer:
              "You can create an account by clicking on the 'Sign Up' button and following the instructions."),
      const FaqEntity(
          question: "How to create a deal for buyer?",
          answer:
              "To create a deal, go to the 'Deals' section and follow the step-by-step guide."),
      const FaqEntity(
          question: "How to create first deal?",
          answer:
              "Navigate to the 'Create Deal' section and fill in the required details to create your first deal."),
      const FaqEntity(
          question: "How I can get money?",
          answer:
              "You can receive money by linking your account to a valid payment method."),
      const FaqEntity(
          question: "How do I create a account?",
          answer:
              "You can create an account by clicking on the 'Sign Up' button and following the instructions."),
    ];

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.faq.tr(),
        titleStyle: TextStyles.rubik14W500Black,
        centerTitle: true,
      ),
      body: FaqListView(faqItems: faqItems),
    );
  }
}
