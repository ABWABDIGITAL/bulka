// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/view/states/job_titles/job_titles_error_view.dart';
import 'package:bulka/modules/work_experience/view/states/job_titles/job_titles_loading_view.dart';
import 'package:bulka/modules/work_experience/view/states/job_titles/job_titles_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWorkExperienceJobDropDownFormField extends StatelessWidget {
  final WorkExperienceCubit cubit;
  const EditWorkExperienceJobDropDownFormField({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkExperienceCubit, WorkExperienceState>(
        buildWhen: (previous, current) =>
            current is GetJobTitlesError ||
            current is GetJobTitlesLoaded ||
            current is GetJobTitlesLoading,
        builder: (context, state) {
          if (state is GetJobTitlesLoading) {
            return const GetJobTitlesLoadingView();
          }
          if (state is GetJobTitlesLoaded) {
            return GetJobTitlesSuccessView(allJobTitles: state.jobTitles,cubit: cubit,);
          }
          if (state is GetJobTitlesError) {
            return GetJobTitlesErrorView(error: state.error);
          }
          return const GetJobTitlesLoadingView();
        });
  }
}
