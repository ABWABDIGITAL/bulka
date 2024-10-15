import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/certifications/controllers/certification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCertificationSaveButton extends StatelessWidget {
  const AddCertificationSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CertificationCubit>();
    return BlocConsumer<CertificationCubit, CertificationState>(
      listenWhen: (previous, current) =>
          current is PostCertificationLoading ||
          current is PostCertificationLoaded ||
          current is PostCertificationError,
      listener: (context, state) {
        if (state is PostCertificationError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is PostCertificationLoaded) {
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
          current is PostCertificationLoading ||
          current is PostCertificationLoaded ||
          current is PostCertificationError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            if (cubit.certificationKey.currentState!.validate())
            {  cubit.postCertification();}
          },
          isLoading: state is PostCertificationLoading ? true : false,
          text: AppStrings.save.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
