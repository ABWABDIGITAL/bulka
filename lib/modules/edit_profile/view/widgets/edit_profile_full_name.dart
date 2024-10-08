import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/edit_profile/controller/edit_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileFormField extends StatelessWidget {
  const EditProfileFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    return DefaultFormField(
      titleText: AppStrings.fullname.tr(),
      hintText: AppStrings.enterYourFullName.tr(),
      controller: cubit.nameController,
    );
  }
}
