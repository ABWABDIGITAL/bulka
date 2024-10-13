// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/data/entities/education_university_entity.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GetEducationUniversitySuccessView extends StatefulWidget {
  final List<EducationUniversityEntity> allEducationUniversities;
  final EducationCubit cubit;
  const GetEducationUniversitySuccessView({
    super.key,
    required this.allEducationUniversities,
    required this.cubit,
  });

  @override
  State<GetEducationUniversitySuccessView> createState() =>
      _GetEducationUniversitySuccessViewState();
}

class _GetEducationUniversitySuccessViewState
    extends State<GetEducationUniversitySuccessView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.university.tr(),
            style: TextStyles.rubik14W500Black),
        vSpace(8),
        CustomDropDownFormField(
          items: widget.allEducationUniversities
              .map(
                (e) => e.name,
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              widget.cubit.selectedUniversityId = widget.allEducationUniversities
                  .firstWhere((element) => element.name == value)
                  .id;
              widget.cubit.selectedUniversity = value!;
              log('selectedUniversity: ${widget.cubit.selectedUniversity}');
              log('selectedUniversityId: ${widget.cubit.selectedUniversityId}');
            });
          },
          value:  widget.cubit.editSelectedUniversity != null && widget.cubit.editSelectedUniversity!.isNotEmpty
                  ? widget.cubit.editSelectedUniversity
                  : widget.cubit.selectedUniversity,
        ),
      ],
    );
  }
}
