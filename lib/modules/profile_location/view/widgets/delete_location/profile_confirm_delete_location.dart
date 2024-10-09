
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/profile_location/view/widgets/delete_location/show_delete_location_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileConfirmDeleteLocation extends StatelessWidget {
  const ProfileConfirmDeleteLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: AppStrings.confirm.tr(),
      onPressed: (){
        showDeleteDialog(context);
      },
    );
  }
}
