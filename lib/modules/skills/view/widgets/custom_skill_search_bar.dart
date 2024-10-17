import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSkillSearchBar extends StatelessWidget {
  const CustomSkillSearchBar({super.key});
  // final debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsCubit>();
    return DefaultFormField(
      hintText: 'Search for a skill',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SvgPicture.asset(
          AssetIcons.searchSvg,
          color: Colors.grey,
          height: 10,
          width: 10,
        ),
      ),
      onChanged: (value) {
        cubit.getSearchedSkills(value);

        /*  debouncer.run(() {
          cubit.getSkills();
        }); */
      },
    );
  }
}
