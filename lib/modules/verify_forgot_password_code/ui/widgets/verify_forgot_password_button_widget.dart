import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/reset_password/ui/views/reset_password_screen.dart';
import 'package:bulka/modules/verify_forgot_password_code/controllers/verify_forgot_password_cubit.dart';
import 'package:bulka/modules/verify_forgot_password_code/controllers/verify_forgot_password_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyForgotPasswordButtonWidget extends StatelessWidget {
  const VerifyForgotPasswordButtonWidget({
    super.key,
    required this.accountForgotPassword,
  });
  final AccountForgotPassword accountForgotPassword;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyForgotPasswordCubit>();

    return BlocConsumer<VerifyForgotPasswordCubit, VerifyForgotPasswordState>(
      listenWhen: (previous, current) =>
          current is VerifyForgotPasswordLoading ||
          current is VerifyForgotPasswordSuccess ||
          current is VerifyForgotPasswordError,
      listener: (context, state) {
        if (state is VerifyForgotPasswordSuccess) {
          // Dialogs.successDialog(context);
        }
        if (state is VerifyForgotPasswordError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is VerifyAccountOtpFilled ||
          current is VerifyForgotPasswordLoading ||
          current is VerifyForgotPasswordSuccess ||
          current is VerifyForgotPasswordError,
      builder: (context, state) {
        return DefaultButton(
          text: AppStrings.verify.tr(),
          elevation: cubit.isOtpFilled ? 1 : 0,
          backgroundColor:
              cubit.isOtpFilled ? AppColors.primary : AppColors.mediumGrey,
          isLoading: state is VerifyForgotPasswordLoading ? true : false,
          textColor:
              cubit.isOtpFilled ? AppColors.white : AppColors.mediumGrey2,
          onPressed: () {
            if (cubit.isOtpFilled) {
              context.push(const ResetPasswordScreen());
            }
          },
        );
      },
    );
  }
}
