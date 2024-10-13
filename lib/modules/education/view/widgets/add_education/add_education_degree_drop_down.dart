// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/states/education_degree/education_degree_error_view.dart';
import 'package:bulka/modules/education/view/states/education_degree/education_degree_loading_view.dart';
import 'package:bulka/modules/education/view/states/education_degree/education_degree_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducationDegreeDropDownFormField extends StatefulWidget {
  final EducationCubit cubit;
  //final List<AllVaccinationEntity> allVaccination;
  const AddEducationDegreeDropDownFormField({
    super.key,
    required this.cubit,
    //  required this.allVaccination,
  });

  @override
  State<AddEducationDegreeDropDownFormField> createState() =>
      _AddEducationDegreeDropDownFormFieldState();
}

class _AddEducationDegreeDropDownFormFieldState
    extends State<AddEducationDegreeDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
        buildWhen: (previous, current) =>
            current is GetEducationDegreeError ||
            current is GetEducationDegreeLoaded ||
            current is GetEducationDegreeLoading,
        builder: (context, state) {
          if (state is GetEducationDegreeLoading) {
            return const GetEducationDegreeLoadingView();
          }
          if (state is GetEducationDegreeLoaded) {
            return GetEducationDegreeSuccessView(
                cubit: widget.cubit,
                allEducationDegrees: state.educationDegree);
          }
          if (state is GetEducationDegreeError) {
            return GetEducationDegreeErrorView(error: state.error);
          }
          return const GetEducationDegreeLoadingView();
        });
  }
}
