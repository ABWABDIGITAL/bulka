import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:bulka/modules/skills/view/widgets/custom_skill_search_bar.dart';
import 'package:bulka/modules/skills/view/widgets/skills_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSkillsScreen extends StatelessWidget {
  const AddSkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsCubit>();
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.skills.tr()),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: BlocProvider(
          create: (context) => SkillsCubit(sl())..getSkills(),
          child: Column(
            children: [
              CustomSkillSearchBar(),
              cubit.searchController.text.isNotEmpty
                  ? SkillsListView()
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
