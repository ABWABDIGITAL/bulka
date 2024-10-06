import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_password_form_field_widget.dart';
import 'package:bulka/modules/authentication/reset_password/controllers/reset_password_cubit.dart';
import 'package:bulka/modules/authentication/reset_password/controllers/reset_password_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordFieldsWidget extends StatelessWidget {
  const ResetPasswordFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      buildWhen: (previous, current) => current is ChangePasswordStatus,
      builder: (context, state) {
        return Form(
          key: cubit.resetKey,
          child: Column(
            children: [
              DefaultPasswordFormFieldWidget(
                title: AppStrings.newPassword.tr(),
                changeVisiabiltyOnPressed: () {
                  cubit.changeVisibilityPassword();
                },
                controller: cubit.newPasswordController,
                isVisiable: cubit.isVisiablePassword,
              ),
              vSpace(5),
              DefaultPasswordFormFieldWidget(
                title: AppStrings.confirmPassword.tr(),
                changeVisiabiltyOnPressed: () {
                  cubit.changeVisibilityConfirmPassword();
                },
                controller: cubit.confirmPasswordController,
                isVisiable: cubit.isVisiableConfirm,
              ),
            ],
          ),
        );
      },
    );
  }
}
