import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_state.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/edit_profile/controller/edit_profile_cubit.dart';
import 'package:bulka/modules/edit_profile/view/widgets/edit_profile_avatar.dart';
import 'package:bulka/modules/edit_profile/view/widgets/edit_profile_button.dart';
import 'package:bulka/modules/edit_profile/view/widgets/edit_profile_full_name_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(sl())..initValues(context),
      child: BlocBuilder<MyProfileInfoCubit, MyProfileInfoState>(
          buildWhen: (previous, current) =>
              current is MyProfileInfoLoading ||
              current is MyProfileInfoSuccess ||
              current is MyProfileInfoError,
          builder: (context, state) {
            return Dialog(
              insetPadding: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Text(AppStrings.editProfile.tr(),
                        style: TextStyles.rubik14W500Black),
                    vSpace(20),
                    const EditProfileAvatar(),
                    vSpace(20),
                    const EditProfileFullNameFormField(),
                    vSpace(20),
                    const EditProfileButton()
                  ],
                ),
              ),
            );
          }),
    );
  }
}
