import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/forgot_password/controllers/forgot_password_cubit.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/ui/views/verify_forgot_password_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          current is GetForgotPasswordCodeLoading ||
          current is GetForgotPasswordCodeSuccess ||
          current is GetForgotPasswordCodeError,
      listener: (context, state) {
        if (state is GetForgotPasswordCodeError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is GetForgotPasswordCodeSuccess) {
          Dialogs.successDialog(context);
        }
      },
      buildWhen: (previous, current) =>
          current is GetForgotPasswordCodeLoading ||
          current is GetForgotPasswordCodeSuccess ||
          current is GetForgotPasswordCodeError,
      builder: (context, state) {
        return DefaultButton(
          text: AppStrings.confirm.tr(),
          onPressed: () {
            bool isValid = false;
            if (cubit.forgotKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              cubit.forgotKey.currentState!.save();
              isValid = true;
            }
            if (isValid) {
              switch (cubit.verifyAccountMethod) {
                case VerifyAccountMethod.email:
                  // cubit.forgotPasswordViaEmailStatesHandled(
                  //   GetForgotPasswordCodeViaEmail(
                  //     email: cubit.emailController.text,
                  //   ),
                  // );
                  context.push(
                    VerifyForgotPasswordScreen(
                      accountForgotPassword: GetForgotPasswordCodeViaEmail(
                        email: cubit.emailController.text,
                      ),
                    ),
                  );
                case VerifyAccountMethod.phone:
                  // cubit.forgotPasswordViaEmailStatesHandled(
                  //   GetForgotPasswordCodeViaPhone(
                  //     phone: cubit.phoneController.text,
                  //   ),
                  // );
                  context.push(
                    VerifyForgotPasswordScreen(
                      accountForgotPassword: GetForgotPasswordCodeViaPhone(
                        phone: cubit.phoneController.text,
                      ),
                    ),
                  );
                case VerifyAccountMethod.unkown:
                  debugPrint(VerifyAccountMethod.unkown.toString());
              }
            }
          },
        );
      },
    );
  }
}
