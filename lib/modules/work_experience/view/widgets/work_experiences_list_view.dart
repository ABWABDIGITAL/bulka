import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/view/states/all_work_experience/all_work_experience_error_view.dart';
import 'package:bulka/modules/work_experience/view/states/all_work_experience/all_work_experience_loading_view.dart';
import 'package:bulka/modules/work_experience/view/states/all_work_experience/all_work_experience_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkExperiencesListView extends StatelessWidget {
  const WorkExperiencesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkExperienceCubit, WorkExperienceState>(
        buildWhen: (previous, current) =>
            current is GetWorkExperienceError ||
            current is GetWorkExperienceLoaded ||
            current is GetWorkExperienceLoading,
        builder: (context, state) {
          if (state is GetWorkExperienceLoading) {
            return const AllWorkExperienceLoadingView();
          }
          if (state is GetWorkExperienceLoaded) {
            return AllWorkExperienceSuccessView(
                workExperiences: state.workExperience);
          }
          if (state is GetWorkExperienceError) {
            return AllWorkExperienceErrorView(error: state.error);
          }
          return const AllWorkExperienceLoadingView();
        });
  }
}
