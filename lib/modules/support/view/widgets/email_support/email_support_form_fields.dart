import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_email_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/support/controller/support_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSupportFormFields extends StatelessWidget {
  const EmailSupportFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SupportCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultEmailFormFieldWidget(
            controller: cubit.emailController,
          ),
          vSpace(24),
          Text(AppStrings.subjectLine.tr(), style: TextStyles.rubik14W500Black),
          vSpace(8),
          DefaultFormField(
            controller: cubit.subjectController,
            //  labelText: AppStrings.subjectLine.tr(),
            hintText: AppStrings.subjectLine.tr(),
          ),
          vSpace(24),
          Text(AppStrings.message.tr(), style: TextStyles.rubik14W500Black),
          vSpace(8),
          DefaultFormField(
            controller: cubit.messageController,
            //labelText: AppStrings.message.tr(),
            hintText: AppStrings.message.tr(),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
