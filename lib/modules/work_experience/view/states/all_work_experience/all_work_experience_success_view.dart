import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/work_experience/data/entities/work_experience_entity.dart';
import 'package:bulka/modules/work_experience/view/widgets/work_experience_list_tile.dart';
import 'package:flutter/material.dart';

class AllWorkExperienceSuccessView extends StatelessWidget {
  final List<WorkExperienceEntity> workExperiences;
  const AllWorkExperienceSuccessView({
    super.key,
    required this.workExperiences,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Divider(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => WorkExperienceListTile(
                  workExperience: workExperiences[index],
                ),
            separatorBuilder: (context, index) => vSpace(8),
            itemCount: workExperiences.length),
      ],
    );
  }
}
