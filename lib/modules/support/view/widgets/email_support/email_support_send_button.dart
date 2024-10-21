import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/support/controller/support_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSupportSendButton extends StatelessWidget {
  const EmailSupportSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SupportCubit>();
    return BlocConsumer<SupportCubit, SupportState>(
      listenWhen: (previous, current) =>
          current is EmailSupportLoading ||
          current is EmailSupportLoaded ||
          current is EmailSupportError,
      listener: (context, state) {
        if (state is EmailSupportError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is EmailSupportLoaded) {
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
          current is EmailSupportLoading ||
          current is EmailSupportLoaded ||
          current is EmailSupportError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            if(cubit.formKey.currentState!.validate()){
              cubit.sendEmail();
            }
          },
          isLoading: state is EmailSupportLoading ? true : false,
          text: AppStrings.sendUsAnEmail.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
