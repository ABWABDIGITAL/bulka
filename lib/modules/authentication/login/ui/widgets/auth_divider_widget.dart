import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthDividerWidget extends StatelessWidget {
  const AuthDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Row(
        children: [
          const Expanded(child: Divider(color: AppColors.grey)),
          hSpace(10),
          Text(
            AppStrings.continueWith.tr(),
            style: TextStyles.rubik13W400IconGrey,
          ),
          hSpace(10),
          const Expanded(child: Divider(color: AppColors.grey)),
        ],
      ),
    );
  }
}
