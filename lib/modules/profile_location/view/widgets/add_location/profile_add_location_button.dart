import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/profile_location/view/screens/profile_all_locations_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileAddLocationButton extends StatelessWidget {
  const ProfileAddLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: AppStrings.save.tr(),
      onPressed: () {
        context.push(const ProfileAllLocationsScreen());
      },
    );
  }
}
