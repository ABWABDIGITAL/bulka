import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/skills/view/widgets/custom_skill_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddSkillsScreen extends StatelessWidget {
  const AddSkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.skills.tr()),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [CustomSkillSearchBar()],
        ),
      ),
    );
  }
}
