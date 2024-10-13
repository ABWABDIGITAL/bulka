// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/states/education_degree/education_degree_loading_view.dart';
import 'package:bulka/modules/education/view/states/education_degree/education_degree_success_view.dart';
import 'package:bulka/modules/education/view/states/education_degree/job_titles_error_view.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditEducationJobDropDownFormField extends StatefulWidget {
  //final List<AllVaccinationEntity> allVaccination;
  const EditEducationJobDropDownFormField({
    super.key,
    //  required this.allVaccination,
  });

  @override
  State<EditEducationJobDropDownFormField> createState() =>
      _EditEducationJobDropDownFormFieldState();
}

class _EditEducationJobDropDownFormFieldState
    extends State<EditEducationJobDropDownFormField> {

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
            return GetEducationDegreeSuccessView(allEducationDegrees: state.educationDegree);
          }
          if (state is GetEducationDegreeError) {
            return GetEducationDegreeErrorView(error: state.error);
          }
          return const GetEducationDegreeLoadingView();
        });
  }
}
