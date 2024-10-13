import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddWorkExperienceCompanyFormField extends StatelessWidget {
  final WorkExperienceCubit cubit;
  const AddWorkExperienceCompanyFormField({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.company.tr(), style: TextStyles.rubik14W500Black),
        vSpace(8),
        DefaultFormField(
          controller: cubit.companyController,
          hintText: AppStrings.company.tr(),
        ),
      ],
    );
  }
}
