import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_cubit.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCvUploadButton extends StatelessWidget {
  const AddCvUploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddCvCubit>();
    return BlocConsumer<AddCvCubit, AddCvState>(
      listenWhen: (previous, current) =>
          current is PostCvLoading ||
          current is PostCvLoaded ||
          current is PostCvError,
      listener: (context, state) {
        if (state is PostCvError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is PostCvLoaded) {
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
          current is PostCvLoading ||
          current is PostCvLoaded ||
          current is PostCvError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            cubit.postCv();
          },
          isLoading: state is PostCvLoading ? true : false,
          text: AppStrings.upload.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
