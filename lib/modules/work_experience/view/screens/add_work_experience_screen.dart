import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/view/widgets/add_work_experience/add_experience_date_time.dart';
import 'package:bulka/modules/work_experience/view/widgets/add_work_experience/add_experience_position_checkbox.dart';
import 'package:bulka/modules/work_experience/view/widgets/add_work_experience/add_work_experience_company_form_field.dart';
import 'package:bulka/modules/work_experience/view/widgets/add_work_experience/add_work_experience_description.dart';
import 'package:bulka/modules/work_experience/view/widgets/add_work_experience/add_work_experience_job_drop_down.dart';
import 'package:bulka/modules/work_experience/view/widgets/add_work_experience/add_work_experience_save_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWorkExperienceScreen extends StatelessWidget {
  const AddWorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.addWorkExperience.tr(),
        centerTitle: true,
        titleStyle: TextStyles.rubik14W500Black,
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.opactiyPrimary,
      ),
      body: BlocProvider(
        create: (context) => WorkExperienceCubit(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            children: [
              const AddWorkExperienceJobDropDownFormField(),
              vSpace(20),
              const AddWorkExperienceCompanyFormField(),
              vSpace(20),
              const AddExperienceDateTime(),
              vSpace(8),
              const AddExperiencePositionCheckbox(),
              const AddWorkExperienceDescription(),
              vSpace(80),
              const AddWorkExperienceSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
