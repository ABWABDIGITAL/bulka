import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/authentication/choose_registration_type/ui/views/choose_registeration_type_screen.dart';
import 'package:bulka/modules/authentication/login/ui/views/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountWidget extends StatelessWidget {
  const AlreadyHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAnAccount.tr(),
          style: TextStyles.rubik14W400DarkGrey2,
        ),
        hSpace(10),
        InkWell(
          onTap: () {
            context.pushOffAll(const LoginScreen());
          },
          child: Text(
            AppStrings.signIn.tr(),
            style: TextStyles.rubik14W400Primary,
          ),
        ),
      ],
    );
  }
}
