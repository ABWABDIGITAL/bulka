import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_email_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_phone_form_field.dart';
import 'package:bulka/modules/contact_info/ui/widgets/chat_form_field.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_animated_headphone_sparkle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.contactInfo.tr()),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const DefaultPhoneFormField(),
            const DefaultEmailFormFieldWidget(),
            vSpace(20),
            const ChatFormField(),
            const ContactInfoAnimatedHeadphoneSparkle(),
            DefaultButton(
              onPressed: () {
                context.pop();
              },
              text: AppStrings.save.tr(),
            )
          ],
        ),
      ),
    );
  }
}
