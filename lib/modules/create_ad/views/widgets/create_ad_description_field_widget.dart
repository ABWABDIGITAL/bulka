import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateAdDescriptionFieldWidget extends StatelessWidget {
  const CreateAdDescriptionFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      hintText: AppStrings.description.tr(),
      onChanged: (value) {},
      keyboardType: TextInputType.multiline,
      maxLines: -1,
      prefixIcon: const Icon(
        Icons.text_snippet,
        color: AppColors.iconGrey,
      ),
    );
  }
}
