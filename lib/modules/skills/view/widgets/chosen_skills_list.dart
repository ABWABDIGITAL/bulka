import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:bulka/modules/skills/view/states/user_skills/user_skills_error_view.dart';
import 'package:bulka/modules/skills/view/states/user_skills/user_skills_loading_view.dart';
import 'package:bulka/modules/skills/view/states/user_skills/user_skills_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChosenSkillsList extends StatelessWidget {
  const ChosenSkillsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsCubit>();
    return BlocBuilder<SkillsCubit, SkillsState>(
        buildWhen: (previous, current) =>
            current is GetUserSkillsError ||
            current is GetUserSkillsLoaded ||
            current is GetUserSkillsLoading,
        builder: (context, state) {
          if (state is GetUserSkillsLoading) {
            return const UserSkillsLoadingView();
          }
          if (state is GetUserSkillsLoaded || cubit.chosenSkills != null) {
            return UserSkillsSuccessView(chosenSkills: cubit.chosenSkills!);
          }
          if (state is GetUserSkillsError) {
            return UserSkillsErrorView(
              error: state.error,
            );
          }
          return const SizedBox();
        });
  }
}
