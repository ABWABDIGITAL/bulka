import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_email_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_phone_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.contactInfo.tr()),
      body: Column(
        children: [
          DefaultPhoneFormField(),
          DefaultEmailFormFieldWidget(),
        ],
      ),
    );
  }
}
