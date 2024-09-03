import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResetPasswordTitleWidget extends StatelessWidget {
  const ResetPasswordTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.createNewPassword.tr(),
          style: TextStyles.rubik17W500Black,
        ),
        Text(
          AppStrings.strongPasswordInclude.tr(),
          style: TextStyles.rubik13W400IconGrey,
        ),
      ],
    );
  }
}
