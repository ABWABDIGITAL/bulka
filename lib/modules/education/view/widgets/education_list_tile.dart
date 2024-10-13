import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/data/entities/education_entity.dart';
import 'package:bulka/modules/education/view/screens/edit_education_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EducationListTile extends StatelessWidget {
  final EducationEntity education;
  const EducationListTile({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(EditEducationScreen(
          education: education,
          cubit: context.read<EducationCubit>(),
        ));
      },
      title: Text(education.educationTitleName,
          style: TextStyles.rubik14W500Black),
      trailing: SvgPicture.asset(AssetIcons.editSvg),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(education.universityName),
          Text(
              '${education.startDate} - ${education.endDate}' /*  • ${workExperience.duration} */),
        ],
      ),
    );
  }
}
