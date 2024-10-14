import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/certifications/controllers/certification_cubit.dart';
import 'package:bulka/modules/certifications/ui/widgets/add_certification_description.dart';
import 'package:bulka/modules/certifications/ui/widgets/add_certification_end_date.dart';
import 'package:bulka/modules/certifications/ui/widgets/add_certification_form_fields.dart';
import 'package:bulka/modules/certifications/ui/widgets/add_certification_save_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCertificationsScreen extends StatelessWidget {
  const AddCertificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.certification.tr()),
      body: BlocProvider(
        create: (context) => CertificationCubit(sl()),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddCertificationFormFields(),
              vSpace(20),
              const AddCertificationEndDate(),
              vSpace(20),
              const AddCertificationDescription(),
              vSpace(60),
              const AddCertificationSaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
