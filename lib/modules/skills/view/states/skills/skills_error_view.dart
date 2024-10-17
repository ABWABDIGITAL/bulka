import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllSkillsErrorView extends StatelessWidget {
  final ApiErrorEntity error;
  const AllSkillsErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return ErrorScreen(
      error: error,
      onPressed: () {
        context.read<SkillsCubit>().getSkills();
      },
    );
  }
}
