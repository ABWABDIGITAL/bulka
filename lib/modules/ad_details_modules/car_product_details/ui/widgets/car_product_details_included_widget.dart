import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarProductDetailsIncludedWidget extends StatelessWidget {
  const CarProductDetailsIncludedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.softGrey4),
          bottom: BorderSide(color: AppColors.softGrey4),
        ),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.whatsIncluded.tr(),
            style: TextStyles.rubik20W700Black,
          ),
          ...List.generate(
            2,
            (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vSpace(15),
                  Text(
                    'Milage',
                    style: TextStyles.rubik16W700Black,
                  ),
                  Text(
                    '3000 km balance',
                    style: TextStyles.rubik16W400Black4,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
