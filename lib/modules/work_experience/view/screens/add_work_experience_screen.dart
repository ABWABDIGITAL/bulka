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
  final WorkExperienceCubit cubit;
  const AddWorkExperienceScreen({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..getJobTitles(),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: AppStrings.addWorkExperience.tr(),
          centerTitle: true,
          titleStyle: TextStyles.rubik14W500Black,
          iconTheme: const IconThemeData(color: AppColors.black),
          backgroundColor: AppColors.opactiyPrimary,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            children: [
               AddWorkExperienceJobDropDownFormField(
                 cubit: cubit
               ),
              vSpace(20),
               AddWorkExperienceCompanyFormField(cubit: cubit,),
              vSpace(20),
               AddExperienceDateTime(cubit: cubit,),
              vSpace(8),
                AddExperiencePositionCheckbox(cubit: cubit,),
                AddWorkExperienceDescription(cubit: cubit,),
              vSpace(80),
                AddWorkExperienceSaveButton(cubit: cubit,),
            ],
          ),
        ),
      ),
    );
  }
}
