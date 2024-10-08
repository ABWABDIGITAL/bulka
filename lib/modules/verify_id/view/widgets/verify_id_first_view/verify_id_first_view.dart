import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_first_view/verify_id_guideline_list.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_photo_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdFirstView extends StatelessWidget {
  const VerifyIdFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: VerifyIdPhotoContainer(
            image: AssetImages.veridyId,
            title: AppStrings.idVerification.tr(),
          ),
        ),
        vSpace(20),
        // Important guidelines
        Text(
          AppStrings.importantGuidelinesForYourIdentity.tr(),
          style: TextStyles.rubik14W400Black2,
        ),
        vSpace(10),

        const VerifyIdGuidelineList(),
        const Spacer(),
      ],
    );
  }
}
