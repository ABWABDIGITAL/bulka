import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/states/all_education/all_education_error_view.dart';
import 'package:bulka/modules/education/view/states/all_education/all_education_loading_view.dart';
import 'package:bulka/modules/education/view/states/all_education/all_education_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationListView extends StatelessWidget {
  const EducationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
        buildWhen: (previous, current) =>
            current is GetEducationError ||
            current is GetEducationLoaded ||
            current is GetEducationLoading,
        builder: (context, state) {
          if (state is GetEducationLoading) {
            return const AllEducationLoadingView();
          }
          if (state is GetEducationLoaded) {
            return AllEducationSuccessView(education: state.education);
          }
          if (state is GetEducationError) {
            return AllEducationErrorView(error: state.error,);
          }
          return const AllEducationLoadingView();
        });
  }
}
