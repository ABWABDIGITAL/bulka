// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddEducationJobDropDownFormField extends StatefulWidget {
  //final List<AllVaccinationEntity> allVaccination;
  const AddEducationJobDropDownFormField({
    super.key,
    //  required this.allVaccination,
  });

  @override
  State<AddEducationJobDropDownFormField> createState() =>
      _AddEducationJobDropDownFormFieldState();
}

class _AddEducationJobDropDownFormFieldState
    extends State<AddEducationJobDropDownFormField> {
  String selectedJob = 'Developer';
  @override
  Widget build(BuildContext context) {
    List<String> cities = ['UI/UX', 'Developer'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.chooseCity.tr(), style: TextStyles.rubik14W500Black),
        vSpace(8),
        CustomDropDownFormField(
          items: cities,
          onChanged: (value) {
            setState(() {
              selectedJob = value!;
            });
          },
          value: selectedJob,
        ),
      ],
    );
  }
}
