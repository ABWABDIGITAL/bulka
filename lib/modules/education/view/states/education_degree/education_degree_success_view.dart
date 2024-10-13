// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/data/entities/education_degree_entity.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GetEducationDegreeSuccessView extends StatefulWidget {
  final List<EducationDegreeEntity> allEducationDegrees;
  final EducationCubit cubit;
  const GetEducationDegreeSuccessView({
    super.key,
    required this.allEducationDegrees,
    required this.cubit,
  });

  @override
  State<GetEducationDegreeSuccessView> createState() =>
      _GetEducationDegreeSuccessViewState();
}

class _GetEducationDegreeSuccessViewState
    extends State<GetEducationDegreeSuccessView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.educationDegree.tr(),
            style: TextStyles.rubik14W500Black),
        vSpace(8),
        CustomDropDownFormField(
          items: widget.allEducationDegrees
              .map(
                (e) => e.name,
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              widget.cubit.selectedDegreeId = widget.allEducationDegrees
                  .firstWhere((element) => element.name == value)
                  .id;
              widget.cubit.selectedDegree = value!;
              log('selectedDegree: ${widget.cubit.selectedDegree}');
              log('selectedDegreeId: ${widget.cubit.selectedDegreeId}');
            });
          },
          value:  widget.cubit.editSelectedEducationDegree != null && widget.cubit.editSelectedEducationDegree!.isNotEmpty
                  ? widget.cubit.editSelectedEducationDegree
                  : widget.cubit.selectedDegree,
        ),
      ],
    );
  }
}
