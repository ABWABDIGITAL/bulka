
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddEducationSaveButton extends StatelessWidget {
  const AddEducationSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: AppStrings.save.tr(),
    );
  }
}
