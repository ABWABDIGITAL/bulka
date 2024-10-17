import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/skills/cubit/skills_cubit.dart';
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllSkillsSuccessView extends StatelessWidget {
  final List<SkillsEntity> skills;
  const AllSkillsSuccessView({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SkillsCubit>();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  cubit.checkAndToggleInterest(skills[index]);
                },
                title: Text(skills[index].name),
                minTileHeight: 40.h,
              ),
          separatorBuilder: (context, index) => vSpace(8),
          itemCount: skills.length),
    );
  }
}
