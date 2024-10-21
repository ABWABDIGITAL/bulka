import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/contact_info/controllers/contact_info_cubit.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_animated_headphone_sparkle.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_form_fields.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.contactInfo.tr()),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider(
          create: (context) =>
              ContactInfoCubit(sl())..initControllerValues(context),
          child: const Column(
            children: [
              ContactInfoFormFields(),
              ContactInfoAnimatedHeadphoneSparkle(),
            ],
          ),
        ),
      ),
    );
  }
}
