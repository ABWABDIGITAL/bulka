import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSkillSearchBar extends StatelessWidget {
  const CustomSkillSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
        hintText: 'Search for a skill',
        prefixIcon: SvgPicture.asset(
          AssetIcons.searchSvg,
          color: Colors.grey,
        ),
        onChanged: (value) {});
  }
}
