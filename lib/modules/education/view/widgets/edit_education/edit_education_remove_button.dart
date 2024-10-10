import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/education/view/widgets/edit_education/edit_education_remove_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditEducationRemoveButton extends StatelessWidget {
  const EditEducationRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      text: AppStrings.remove.tr(),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (BuildContext context) {
            return const EducationRemoveBottomSheet();
          },
        );
      },
      backgroundColor: AppColors.opactiyPrimary,
      textColor: AppColors.primary,
      borderColor: AppColors.primary200,
    );
  }
}
