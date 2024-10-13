// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/data/entities/education_degree_entity.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/data/entities/job_titles_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetEducationDegreeSuccessView extends StatefulWidget {
  final List<EducationDegreeEntity> allEducationDegrees;
  const GetEducationDegreeSuccessView({
    super.key,
    required this.allEducationDegrees,
  });

  @override
  State<GetEducationDegreeSuccessView> createState() => _GetEducationDegreeSuccessViewState();
}

class _GetEducationDegreeSuccessViewState extends State<GetEducationDegreeSuccessView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EducationCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.educationDegree.tr(), style: TextStyles.rubik14W500Black),
        vSpace(8),
        CustomDropDownFormField(
          items: widget.allEducationDegrees
              .map(
                (e) => e.name,
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              cubit.selectedJobId = widget.allEducationDegrees
              .firstWhere((element) => element.name == value)
              .id;
              cubit.selectedJob = value!;
            });
          },
          value: cubit.selectedJob,
        ),
      ],
    );
  }
}
