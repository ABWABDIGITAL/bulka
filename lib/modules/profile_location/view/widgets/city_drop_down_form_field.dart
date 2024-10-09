// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/profile_location/view/widgets/custom_drop_down_form_field.dart';
import 'package:flutter/material.dart';

class CityDropDownFormField extends StatefulWidget {
  //final List<AllVaccinationEntity> allVaccination;
  const CityDropDownFormField({
    super.key,
    //  required this.allVaccination,
  });

  @override
  State<CityDropDownFormField> createState() => _CityDropDownFormFieldState();
}

class _CityDropDownFormFieldState extends State<CityDropDownFormField> {
  String selectedCity = '';
  @override
  Widget build(BuildContext context) {
    List<String> cities = ['Cairo', 'Alex'];
    return Column(
      children: [
        const Text("Choose City", style: TextStyle(fontSize: 16)),
        vSpace(8),
        CustomDropDownFormField(
          items: cities,
          onChanged: (value) {
            setState(() {
              selectedCity = value!;
            });
          },
          value: selectedCity,
        ),
      ],
    );
  }
}
