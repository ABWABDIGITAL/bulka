import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_company_form_field.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_date_time.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_description.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_job_drop_down.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_position_checkbox.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_save_button.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEducationScreen extends StatelessWidget {
  const AddEducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.addEducation.tr(),
        centerTitle: true,
        titleStyle: TextStyles.rubik14W500Black,
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.opactiyPrimary,
      ),
      body: BlocProvider(
        create: (context) => EducationCubit(sl()),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            children: [
              const AddEducationJobDropDownFormField(),
              vSpace(20),
              const AddEducationCompanyFormField(),
              vSpace(20),
              const AddEducationDateTime(),
              vSpace(8),
              const AddEducationPositionCheckbox(),
              const AddEducationDescription(),
              vSpace(80),
              const AddEducationSaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
