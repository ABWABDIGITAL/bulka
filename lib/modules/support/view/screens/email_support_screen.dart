import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/support/controller/support_cubit.dart';
import 'package:bulka/modules/support/view/widgets/email_support/email_support_form_fields.dart';
import 'package:bulka/modules/support/view/widgets/email_support/email_support_send_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailSupportScreen extends StatelessWidget {
  const EmailSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.emailSupport.tr(),
      ),
      body: BlocProvider(
        create: (context) => SupportCubit(sl()),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              EmailSupportFormFields(),
              Spacer(),
              EmailSupportSendButton()
            ],
          ),
        ),
      ),
    );
  }
}
