import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:bulka/modules/skills/view/states/skills/skills_error_view.dart';
import 'package:bulka/modules/skills/view/states/skills/skills_loading_view.dart';
import 'package:bulka/modules/skills/view/states/skills/skills_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillsListView extends StatelessWidget {
  const SkillsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit= context.read<SkillsCubit>();
    return BlocBuilder<SkillsCubit, SkillsState>(
        buildWhen: (previous, current) =>
            current is GetSkillsError ||
            current is GetSkillsLoaded ||
            current is GetSkillsLoading,

        builder: (context, state) {
          if (state is GetSkillsLoading) {
            return const AllSkillsLoadingView();
          }
          if (state is GetSkillsLoaded
             ||cubit.skills!=null
              ) {
            return AllSkillsSuccessView(skills: cubit.skills!);
          }
          if (state is GetSkillsError) {
            return AllSkillsErrorView(
              error: state.error,
            );
          }
          return const SizedBox();
        });
  }
}
