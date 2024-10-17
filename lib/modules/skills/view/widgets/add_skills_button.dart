import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSkillsButton extends StatelessWidget {
  const AddSkillsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SkillsCubit>();
    return BlocConsumer<SkillsCubit, SkillsState>(
      listenWhen: (previous, current) =>
          current is PostSkillsLoading ||
          current is PostSkillsLoaded ||
          current is PostSkillsError ||
          current is DeleteSkillsLoading ||
          current is DeleteSkillsLoaded ||
          current is DeleteSkillsError,
      listener: (context, state) {
        if (state is PostSkillsError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is PostSkillsLoaded) {
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
          current is PostSkillsLoading ||
          current is PostSkillsLoaded ||
          current is PostSkillsError ||
          current is DeleteSkillsLoading ||
          current is DeleteSkillsLoaded ||
          current is DeleteSkillsError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            cubit.postSkills();
          },
          isLoading: state is PostSkillsLoading || state is DeleteSkillsLoading
              ? true
              : false,
          text: AppStrings.save.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
