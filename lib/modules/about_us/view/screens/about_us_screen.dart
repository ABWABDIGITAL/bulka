import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/about_us/controller/about_us_cubit.dart';
import 'package:bulka/modules/about_us/view/widgets/about_us_privacy_of_use.dart';
import 'package:bulka/modules/about_us/view/widgets/about_us_social_media.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.aboutUs.tr(),
      ),
      body: BlocProvider(
        create: (context) => AboutUsCubit(sl())..getSocialLinks(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const AboutUsPrivacyOfUse(),
              vSpace(20),
              const AboutUsSocialMedia(),
            ],
          ),
        ),
      ),
    );
  }
}
