import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/data/entities/work_experience_entity.dart';
import 'package:bulka/modules/work_experience/view/screens/edit_work_experience_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WorkExperienceListTile extends StatelessWidget {
  final WorkExperienceEntity workExperience;
  const WorkExperienceListTile({
    super.key,
    required this.workExperience,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(EditWorkExperienceScreen(
          workExperience: workExperience,
          cubit: context.read<WorkExperienceCubit>(),
        ));
      },
      title:
          Text(workExperience.jobTitleName, style: TextStyles.rubik14W500Black),
      trailing: SvgPicture.asset(AssetIcons.editSvg),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(workExperience.companyName),
          Text(
              '${workExperience.startDate} - ${workExperience.endDate}' /*  • ${workExperience.duration} */),
        ],
      ),
    );
  }
}
