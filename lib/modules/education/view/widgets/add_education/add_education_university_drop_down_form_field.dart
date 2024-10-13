// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/states/education_university/education_university_error_view.dart';
import 'package:bulka/modules/education/view/states/education_university/education_university_loading_view.dart';
import 'package:bulka/modules/education/view/states/education_university/education_university_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducationUniversityDropDownFormField extends StatefulWidget {
  final EducationCubit cubit;
  //final List<AllVaccinationEntity> allVaccination;
  const AddEducationUniversityDropDownFormField({
    super.key,
    required this.cubit,
    //  required this.allVaccination,
  });

  @override
  State<AddEducationUniversityDropDownFormField> createState() =>
      _AddEducationUniversityDropDownFormFieldState();
}

class _AddEducationUniversityDropDownFormFieldState
    extends State<AddEducationUniversityDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EducationCubit, EducationState>(
        buildWhen: (previous, current) =>
            current is GetEducationUniversityError ||
            current is GetEducationUniversityLoaded ||
            current is GetEducationUniversityLoading,
        builder: (context, state) {
          if (state is GetEducationUniversityLoading) {
            return const GetEducationUniversityLoadingView();
          }
          if (state is GetEducationUniversityLoaded) {
            return GetEducationUniversitySuccessView(
                cubit: widget.cubit,
                allEducationUniversities: state.educationUniversity);
          }
          if (state is GetEducationUniversityError) {
            return GetEducationUniversityErrorView(error: state.error);
          }
          return const GetEducationUniversityLoadingView();
        });
  }
}
