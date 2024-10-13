// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/data/entities/job_titles_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetJobTitlesSuccessView extends StatefulWidget {
  final List<JobTitlesEntity> allJobTitles;
  const GetJobTitlesSuccessView({
    super.key,
    required this.allJobTitles,
  });

  @override
  State<GetJobTitlesSuccessView> createState() => _GetJobTitlesSuccessViewState();
}

class _GetJobTitlesSuccessViewState extends State<GetJobTitlesSuccessView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkExperienceCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.jobTitle.tr(), style: TextStyles.rubik14W500Black),
        vSpace(8),
        CustomDropDownFormField(
          items: widget.allJobTitles
              .map(
                (e) => e.name,
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              cubit.selectedJobId = widget.allJobTitles
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
