import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/authentication/choose_verify_method/controllers/choose_verify_method_cubit.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/views/verify_phone_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseVerifyAccountButtonWidget extends StatelessWidget {
  const ChooseVerifyAccountButtonWidget(this.params, {super.key});
  final ChooseVerifyMethodParams params;
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
            // context.pushReplacement(VerifyAccountScreen(
            //     accountVerification: VerifyAccountWithEmail()));
            case VerifyAccountMethod.phone:
              context.pushReplacement(VerifyPhoneScreen(params));
            case VerifyAccountMethod.unkown:
              return;
          }
        },
        text: AppStrings.Continue.tr(),
      ),
    );
  }
}
