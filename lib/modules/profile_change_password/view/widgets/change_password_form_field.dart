import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_password_form_field_widget.dart';
import 'package:bulka/modules/profile_change_password/controller/profile_change_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChangePasswordFormFields extends StatelessWidget {
  const ProfileChangePasswordFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileChangePasswordCubit>();
    return Form(
      key: cubit.formKey,
      child:
          BlocBuilder<ProfileChangePasswordCubit, ProfileChangePasswordState>(
        buildWhen: (previous, current) =>
            current is ProfileOldPasswordStatus ||
            current is ProfileNewPasswordStatus ||
            current is ProfileConfirmNewPasswordStatus,
        builder: (context, state) {
          return Column(
            children: [
              DefaultPasswordFormFieldWidget(
                title: AppStrings.oldPassword.tr(),
                controller: cubit.oldPasswordController,
                isVisiable: cubit.isVisiableOld,
                changeVisiabiltyOnPressed: () {
                  cubit.changeOldVisibility();
                },
              ),
              vSpace(20),
              DefaultPasswordFormFieldWidget(
                controller: cubit.newPasswordController,
                title: AppStrings.newPassword.tr(),
                isVisiable: cubit.isVisiableNew,
                changeVisiabiltyOnPressed: () {
                  cubit.changeNewVisibility();
                },
              ),
              vSpace(20),
              DefaultPasswordFormFieldWidget(
                title: AppStrings.confirmNewPassword.tr(),
                controller: cubit.confirmNewPasswordController,
                isVisiable: cubit.isVisiableconfirmNew,
                changeVisiabiltyOnPressed: () {
                  cubit.changeConfirmNewVisibility();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
