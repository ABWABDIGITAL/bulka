import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomSkillSearchBar extends StatelessWidget {
  const CustomSkillSearchBar({super.key});
  // final debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsCubit>();
    return BlocBuilder<SkillsCubit, SkillsState>(
      builder: (context, state) {
        return DefaultFormField(
          controller: cubit.searchController,
          needValidation: false,
          hintText: AppStrings.searchForSkill.tr(),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              AssetIcons.searchSvg,
              color: Colors.grey,
              height: 10,
              width: 10,
            ),
          ),
          suffixIcon: cubit.searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    cubit.searchController.clear();

                    cubit.getSearchedSkills();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ))
              : null,
          onChanged: (_) {
            cubit.getSearchedSkills();

            /*  debouncer.run(() {
              cubit.getSkills();
            }); */
          },
        );
      },
    );
  }
}
