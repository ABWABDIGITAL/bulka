import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
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
    return BlocBuilder<SkillsCubit, SkillsState>(
      buildWhen: (previous, current) =>
          current is AddSearchList || current is AddChosenSkillsList,
      builder: (context, state) {
        return cubit.searchController.text.isNotEmpty
            ? Container(
                decoration: BoxDecoration(color: AppColors.white, boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGrey.withOpacity(0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ]),
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          onTap: () {
                            cubit.checkAndToggleInterest(index);
                          },
                          title: Text(skills[index].name),
                          minTileHeight: 40.h,
                        ),
                    separatorBuilder: (context, index) => vSpace(8),
                    itemCount: skills.length),
              )
            : const SizedBox();
      },
    );
  }
}
