import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_work_experience_remove_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWorkExperienceRemoveButton extends StatelessWidget {
  final WorkExperienceCubit workCubit;
  const EditWorkExperienceRemoveButton({
    super.key,
    required this.workCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: workCubit,
      child: DefaultButton(
        text: AppStrings.remove.tr(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            builder: (BuildContext context) {
              return WorkExperienceRemoveBottomSheet(
                workCubit: workCubit,
              );
            },
          );
        },
        backgroundColor: AppColors.opactiyPrimary,
        textColor: AppColors.primary,
        borderColor: AppColors.primary200,
      ),
    );
  }
}
