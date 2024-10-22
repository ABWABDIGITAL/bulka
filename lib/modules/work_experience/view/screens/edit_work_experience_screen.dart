import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/data/entities/work_experience_entity.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_experience_date_time.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_experience_position_checkbox.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_work_experience_company_form_field.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_work_experience_description.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_work_experience_job_drop_down.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_work_experience_remove_button.dart';
import 'package:bulka/modules/work_experience/view/widgets/edit_work_experience/edit_work_experience_save_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWorkExperienceScreen extends StatelessWidget {
  final WorkExperienceEntity workExperience;
  final WorkExperienceCubit cubit;
  const EditWorkExperienceScreen({
    super.key,
    required this.workExperience,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit
        ..getJobTitles()
        ..initValues(context, workExperience),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: AppStrings.editWorkExperience.tr(),
          centerTitle: true,
          titleStyle: TextStyles.rubik14W500Black,
          iconTheme: const IconThemeData(color: AppColors.black),
          backgroundColor: AppColors.opactiyPrimary,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.r),
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                 EditWorkExperienceJobDropDownFormField(
                  cubit: cubit,
                ),
                vSpace(20),
                const EditWorkExperienceCompanyFormField(),
                vSpace(20),
                const EditExperienceDateTime(),
                vSpace(8),
                const EditExperiencePositionCheckbox(),
                const EditWorkExperienceDescription(),
                vSpace(60),
                const EditWorkExperienceSaveButton(),
                vSpace(10),
                EditWorkExperienceRemoveButton(workCubit: cubit)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
