import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/reset_password/controllers/reset_password_cubit.dart';
import 'package:bulka/modules/authentication/reset_password/controllers/reset_password_state.dart';
import 'package:bulka/modules/authentication/reset_password/ui/widgets/reset_password_bottom_success_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  const ResetPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordError,
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Dialogs.successDialog(
            context,
            onSuccessFinishedCallback: (p0) {
              context.pop();
              resetPasswordSuccessBottomWidget(context);
            },
          );
        }
        if (state is ResetPasswordError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordError,
      builder: (context, state) {
        return DefaultButton(
          text: AppStrings.confirm.tr(),
          isLoading: state is ResetPasswordLoading ? true : false,
          onPressed: () {
            FocusScope.of(context).unfocus();
            if (cubit.resetKey.currentState!.validate()) {
              cubit.resetKey.currentState!.save();

              cubit.resetPasswordStatesHandled();
            }
          },
        );
      },
    );
  }
}
