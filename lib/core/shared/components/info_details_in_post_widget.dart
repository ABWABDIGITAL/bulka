import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDetailsInPostWidget extends StatelessWidget {
  const InfoDetailsInPostWidget(this.post, {super.key});
  final PostDetailsEntity post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                post.adDetailsEntity.mainInfo.name,
                style: TextStyles.roboto14W600Black2,
              ),
            ),
            if (post.adDetailsEntity.mainInfo.price != null)
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 7.r, horizontal: 12.r),
                child: Text(
                  '${post.adDetailsEntity.mainInfo.price} ${currentLanguage?.currency}',
                  style: TextStyles.roboto14W600Black2,
                ),
              )
          ],
        ),
        vSpace(16),
        CustomeExpandableText(
          post.adDetailsEntity.mainInfo.description,
          style: TextStyles.roboto12W400IconGrey,
        ),
      ],
    );
  }
}
