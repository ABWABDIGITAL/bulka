

import 'dart:io';

import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AboutUsSocialMedia extends StatelessWidget {
  const AboutUsSocialMedia({
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
            title:  Text(AppStrings.facebook.tr()),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          const Divider(height: 1, color: AppColors.darkGrey3),
          ListTile(
            title: const Text('Instagram'),
            trailing: Icon(Platform.isIOS
                ? Icons.arrow_forward_ios
                : Icons.arrow_forward),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            title:  Text(AppStrings.twitter.tr()),
            trailing: Icon(Platform.isIOS
                ? Icons.arrow_forward_ios
                : Icons.arrow_forward),
            onTap: () {},
          ),
          const Divider(height: 1, color: AppColors.darkGrey3),
          ListTile(
            title:  Text(AppStrings.linkedIn.tr()),
            trailing: Icon(Platform.isIOS
                ? Icons.arrow_forward_ios
                : Icons.arrow_forward),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
