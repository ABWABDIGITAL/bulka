import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_photo_container.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_second_view/verify_id_guideline_list_second_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdSecondView extends StatelessWidget {
  const VerifyIdSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16.r),
          child: VerifyIdPhotoContainer(
            image: AssetImages.selfPhoto,
            title: AppStrings.selfPhoto.tr(),
          ),
        ),
        vSpace(16),
        VerifyIdGuidelineListSecondView(),
        const Spacer(),
      ],
    );
  }
}
