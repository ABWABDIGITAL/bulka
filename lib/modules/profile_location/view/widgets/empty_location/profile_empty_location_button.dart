import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/profile_location/view/screens/profile_add_location_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileEmptyLocationButton extends StatelessWidget {
  const ProfileEmptyLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: AppStrings.addLocation.tr(),
      onPressed: () {
        context.push(const ProfileAddLocationScreen());
      },
    );
  }
}
