import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEducationPositionCheckbox extends StatelessWidget {
  const AddEducationPositionCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EducationCubit>();
    return BlocBuilder<EducationCubit, EducationState>(
      buildWhen: (previous, current) => current is EducationCurrentPosition,
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
