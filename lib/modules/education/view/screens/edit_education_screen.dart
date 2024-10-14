import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/data/entities/education_entity.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_date_time.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_degree_drop_down.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_description.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_position_checkbox.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_remove_button.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_save_button.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_university_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEducationScreen extends StatelessWidget {
  final EducationEntity education;
  final EducationCubit cubit;
  const EditEducationScreen(
      {super.key, required this.education, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..getEducationDegree()..getEducationUniversity()..initValues(context, education),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: AppStrings.editEducation.tr(),
          centerTitle: true,
          titleStyle: TextStyles.rubik14W500Black,
          iconTheme: const IconThemeData(color: AppColors.black),
          backgroundColor: AppColors.opactiyPrimary,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            children: [
              EditEducationDegreeDropDownFormField(cubit: cubit),
              vSpace(20),
              EditEducationUniversityDropDownFormField(
                cubit: cubit,
              ),
              vSpace(20),
              const EditEducationDateTime(),
              vSpace(8),
              const EditEducationPositionCheckbox(),
              const EditEducationDescription(),
              vSpace(60),
              const EditEducationSaveButton(),
              vSpace(10),
               EditEducationRemoveButton(cubit: cubit,)
            ],
          ),
        ),
      ),
    );
  }
}
