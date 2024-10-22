
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWorkExperienceSaveButton extends StatelessWidget {
  const EditWorkExperienceSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     var cubit = context.read<WorkExperienceCubit>();
    return BlocConsumer<WorkExperienceCubit, WorkExperienceState>(
      listenWhen: (previous, current) =>
          current is PostWorkExperienceLoading ||
          current is PostWorkExperienceLoaded ||
          current is PostWorkExperienceError,
      listener: (context, state) {
        if (state is PostWorkExperienceError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is PostWorkExperienceLoaded) {
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
          current is PostWorkExperienceLoading ||
          current is PostWorkExperienceLoaded ||
          current is PostWorkExperienceError,
      builder: (context, state) {
        return DefaultButton(
          
          onPressed: () {
            if (cubit.formKey.currentState!.validate()){
              cubit.postEditWorkExperience();
            }
          },
          isLoading: state is PostWorkExperienceLoading? true:false ,
         text: AppStrings.save.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );

  }
}
