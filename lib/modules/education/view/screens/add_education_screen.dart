import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_date_time.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_degree_drop_down.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_description.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_position_checkbox.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_save_button.dart';
import 'package:bulka/modules/education/view/widgets/add_education/add_education_university_drop_down_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEducationScreen extends StatelessWidget {
  final EducationCubit cubit;
  const AddEducationScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..getEducationDegree()..getEducationUniversity(),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: AppStrings.addEducation.tr(),
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
                AddEducationDegreeDropDownFormField(
                  cubit: cubit,
                ),
                vSpace(20),
                AddEducationUniversityDropDownFormField(
                  cubit: cubit,
                ),
                vSpace(20),
                AddEducationDateTime(
                  cubit: cubit,
                ),
                vSpace(8),
                AddEducationPositionCheckbox(cubit: cubit),
                AddEducationDescription(cubit: cubit),
                vSpace(80),
                AddEducationSaveButton(cubit: cubit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
