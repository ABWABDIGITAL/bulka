import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/abstractions/account_verification.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:bulka/modules/choose_verify_method/controllers/choose_verify_method_cubit.dart';
import 'package:bulka/modules/choose_verify_method/controllers/choose_verify_method_state.dart';
import 'package:bulka/modules/verify_account/ui/views/verify_account_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseVerifyAccountButtonWidget extends StatelessWidget {
  const ChooseVerifyAccountButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseVerifyMethodCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: DefaultButton(
        borderRadiusValue: 12.r,
        onPressed: () {
          switch (cubit.verifyAccountMethod) {
            case VerifyAccountMethod.email:
              context.pushReplacement(VerifyAccountScreen(
                  accountVerification: VerifyAccountWithEmail()));
            case VerifyAccountMethod.phone:
              context.pushReplacement(VerifyAccountScreen(
                  accountVerification: VerifyAccountWithPhone()));
            case VerifyAccountMethod.unkown:
              return;
          }
        },
        text: AppStrings.Continue.tr(),
      ),
    );
  }
}
