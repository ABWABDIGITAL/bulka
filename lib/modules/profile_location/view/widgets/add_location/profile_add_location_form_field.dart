import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileAddLocationFormField extends StatelessWidget {
  const ProfileAddLocationFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.locationName.tr(), style: TextStyles.rubik14W500Black),
        vSpace(8),
        DefaultFormField(
          hintText: AppStrings.addLocationName.tr(),
        ),
      ],
    );
  }
}
