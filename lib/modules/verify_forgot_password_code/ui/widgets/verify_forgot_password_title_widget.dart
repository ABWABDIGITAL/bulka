import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:bulka/core/shared/widgets/build_forgot_password_return_method_circle_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VerifyForgotPasswordTitleWidget extends StatelessWidget {
  const VerifyForgotPasswordTitleWidget({
    super.key,
    required this.accountForgotPassword,
  });
  final AccountForgotPassword accountForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.verificationCode.tr(),
          style: TextStyles.rubik17W500Black,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.enterTheIncommingCode.tr(),
                style: TextStyles.rubik13W400IconGrey,
              ),
            ),
            Row(
              children: [
                BuildForgotPasswordReturnMethodCircleWidget(
                  onTap: () {},
                  isSelected: true,
                  svgPath:
                      accountForgotPassword is GetForgotPasswordCodeViaEmail
                          ? AssetIcons.smsSvg
                          : AssetIcons.callSvg,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
