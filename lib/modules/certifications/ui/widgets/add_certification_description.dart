import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/certifications/controllers/certification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCertificationDescription extends StatelessWidget {
  const AddCertificationDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CertificationCubit>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppStrings.description.tr(), style: TextStyles.rubik14W500Black),
      vSpace(8),
      DefaultFormField(
        controller: cubit.certificationDescriptionController,
        maxLines: 4,
        hintText: AppStrings.describeYourCertification.tr(),
      ),
    ]);
  }
}
