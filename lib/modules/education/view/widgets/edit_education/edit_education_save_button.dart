
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditEducationSaveButton extends StatelessWidget {
  const EditEducationSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   var cubit = context.read<EducationCubit>();
    return BlocConsumer<EducationCubit, EducationState>(
      listenWhen: (previous, current) =>
          current is PostEducationLoading ||
          current is PostEducationLoaded ||
          current is PostEducationError,
      listener: (context, state) {
        if (state is PostEducationError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is PostEducationLoaded) {
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
          current is PostEducationLoading ||
          current is PostEducationLoaded ||
          current is PostEducationError,
      builder: (context, state) {
        return DefaultButton(
          
          onPressed: () {
           if (cubit.formKey.currentState!.validate()) 
             { cubit.postEditEducation();}
          },
          isLoading: state is PostEducationLoading? true:false ,
         text: AppStrings.save.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
