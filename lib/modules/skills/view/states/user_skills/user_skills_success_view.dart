import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSkillsSuccessView extends StatelessWidget {
  final List<SkillsEntity> chosenSkills;

  const UserSkillsSuccessView({super.key, required this.chosenSkills});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsCubit>();
    return BlocBuilder<SkillsCubit, SkillsState>(
      buildWhen: (previous, current) =>
          current is RemoveChosenSkillsList || current is AddChosenSkillsList,
      builder: (context, state) {
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.start,
          // runSpacing: 10,
          spacing: 10,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          children: List.generate(
            chosenSkills.length,
            (index) => Chip(
              deleteIcon: const Icon(Icons.close),
              side: BorderSide.none,
              backgroundColor: AppColors.mediumGrey17,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              label: Text(
                chosenSkills[index].name,
                style: TextStyles.rubik14W400Black2,
              ),
              onDeleted: () {
                cubit.deleteSkills(chosenSkills[index].id!);
                cubit.removeChosenSkill(index);
              },
            ),
          ),
        );
      },
    );
  }
}
