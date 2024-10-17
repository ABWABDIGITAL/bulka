import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/profile_change_password/controller/profile_change_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChangePasswordSaveButton extends StatelessWidget {
  const ProfileChangePasswordSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProfileChangePasswordCubit>();
    return BlocConsumer<ProfileChangePasswordCubit, ProfileChangePasswordState>(
      listenWhen: (previous, current) =>
          current is ProfileChangePasswordLoading ||
          current is ProfileChangePasswordLoaded ||
          current is ProfileChangePasswordError,
      listener: (context, state) {
        if (state is ProfileChangePasswordError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is ProfileChangePasswordLoaded) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppStrings.ok.tr()),
                ),
              ],
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is ProfileChangePasswordLoading ||
          current is ProfileChangePasswordLoaded ||
          current is ProfileChangePasswordError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.changePassword();
            }
          },
          isLoading: state is ProfileChangePasswordLoading ? true : false,
          text: AppStrings.save.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
