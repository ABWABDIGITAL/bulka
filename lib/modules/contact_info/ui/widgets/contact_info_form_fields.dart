import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_email_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_phone_form_field.dart';
import 'package:bulka/modules/contact_info/controllers/contact_info_cubit.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_update_email_button.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_update_phone_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoFormFields extends StatelessWidget {
  const ContactInfoFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactInfoCubit>();
    return Form(
      key: cubit.formKey,
      child: BlocBuilder<ContactInfoCubit, ContactInfoState>(
        buildWhen: (previous, current) => current is ContactInfoEditPhone|| current is ContactInfoEditEmail,
        builder: (context, state) {
          return Column(
            children: [
              DefaultPhoneFormField(
                onChanged: (value) {
                  cubit.checkPhoneValue(context);
                },
                controller: cubit.phoneController,
                suffixIcon: cubit.isOldPhone
                    ? TextButton(
                        onPressed: () {
                          cubit.editPhone();
                        },
                        child: Text(
                          'Edit',
                          style: TextStyles.rubik14W600Primary,
                        ),
                      )
                    : ContactInfoUpdatePhoneButton(cubit: cubit),
              ),
              DefaultEmailFormFieldWidget(
                onChanged: (value) {
                  cubit.checkEmailValue(context);
                },
                suffixIcon: cubit.isOldEmail
                    ? TextButton(
                        onPressed: () {
                          cubit.editEmail();
                        },
                        child: Text(
                          'Edit',
                          style: TextStyles.rubik14W600Primary,
                        ),
                      )
                    : ContactInfoUpdateEmailButton(cubit: cubit),
                controller: cubit.emailController,
              ),
            ],
          );
        },
      ),
    );
  }
}
