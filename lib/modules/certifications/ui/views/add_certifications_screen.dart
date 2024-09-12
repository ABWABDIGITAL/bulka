import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddCertificationsScreen extends StatelessWidget {
  const AddCertificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.certification.tr()),
      body: Column(
        children: [],
      ),
    );
  }
}
