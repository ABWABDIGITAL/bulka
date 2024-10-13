import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExperiencePositionCheckbox extends StatelessWidget {
  final WorkExperienceCubit cubit ;
  const AddExperiencePositionCheckbox({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<WorkExperienceCubit, WorkExperienceState>(
      buildWhen: (previous, current) =>
          current is WorkExperienceCurrentPosition,
      builder: (context, state) {
        return CheckboxListTile.adaptive(
            title: Text(AppStrings.isCurrentPosition.tr(),
                style: TextStyles.rubik12W400DarkGrey4),
            side: const BorderSide(width: 1, color: AppColors.darkBlue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: AppColors.primary,
            hoverColor: Colors.transparent,
            value: cubit.isCurrentPosition,
            contentPadding: EdgeInsets.zero,
            checkboxShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (value) => cubit.onCurrentPosition(value!));
      },
    );
  }
}
