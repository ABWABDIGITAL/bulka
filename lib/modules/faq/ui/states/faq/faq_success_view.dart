
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/faq/data/entities/faq_entity.dart';
import 'package:flutter/material.dart';

class FaqSuccessView extends StatelessWidget {
  const FaqSuccessView({
    super.key,
    required this.faqItems,
  });

  final List<FaqEntity> faqItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => vSpace(16),
      padding: const EdgeInsets.all(24.0),
      itemCount: faqItems.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
            border: Border.all(color: AppColors.darkGrey2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            childrenPadding: const EdgeInsets.all(16),
            title: Text(
              faqItems[index].question,
              style: TextStyles.rubik14W500LigtBlack,
            ),expandedCrossAxisAlignment: CrossAxisAlignment.start,
         
            trailing: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.darkGrey2,
            ),
            children: [
              Text(
                faqItems[index].answer,
                style: TextStyles.rubik13W400IconGrey,
              )
            ],
          ),
        );
      },
    );
  }
}

