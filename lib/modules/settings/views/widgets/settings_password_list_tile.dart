import 'dart:io';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/profile_change_password/view/screens/profile_change_password_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPasswordListTile extends StatelessWidget {
  const SettingsPasswordListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      minVerticalPadding: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Image.asset(AssetIcons.lock1),
      ),
      title: Text(AppStrings.password.tr(), style: TextStyles.rubik13W400Black),
      trailing:  Icon(Platform.isIOS?  Icons.arrow_forward_ios: Icons.arrow_forward),
      onTap: () {
        context.push(const ProfileChangePasswordScreen());
      },
    );
  }
}
