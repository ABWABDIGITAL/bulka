import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/about_us/view/widgets/about_us_privacy_of_use.dart';
import 'package:bulka/modules/about_us/view/widgets/about_us_social_media.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.aboutUs.tr(),
        titleStyle: TextStyles.rubik14W500Black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AboutUsPrivacyOfUse(),
            vSpace(20),
            const AboutUsSocialMedia(),
          ],
        ),
      ),
    );
  }
}
