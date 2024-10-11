
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/profile_location/view/screens/profile_delete_location_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileAllLocationDeleteButton extends StatelessWidget {
  const ProfileAllLocationDeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: AppStrings.delete.tr(),
      onPressed: () {
        context.push(const ProfileDeleteLocationScreen());
      },
      backgroundColor: AppColors.opactiyPrimary,
      textColor: AppColors.primary,
      borderColor: AppColors.primary200,
    );
  }
}