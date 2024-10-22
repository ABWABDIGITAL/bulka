import 'dart:io';

import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/about_us/controller/about_us_cubit.dart';
import 'package:bulka/modules/about_us/view/screens/terms_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsPrivacyOfUse extends StatelessWidget {
  const AboutUsPrivacyOfUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkGrey3),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(AppStrings.privacyOfUse.tr()),
            trailing: Icon(
                Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward),
            onTap: () {},
          ),
          const Divider(height: 1, color: AppColors.darkGrey3),
          ListTile(
            title: Text(AppStrings.privacyAndTerms.tr()),
            trailing: Icon(
                Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward),
            onTap: () {
              context.push(
                TermsScreen(
                  cubit: context.read<AboutUsCubit>(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
