import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/edit_profile/controller/edit_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    final profileCubit = context.read<MyProfileInfoCubit>();

    return BlocProvider(
      create: (context) => EditProfileCubit(sl()),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
          listenWhen: (previous, current) =>
              current is EditProfileLoading ||
              current is EditProfileLoaded ||
              current is EditProfileError,
          listener: (context, state) {
            if (state is EditProfileError) {
              Dialogs.errorDialog(context: context, error: state.error);
            }
            if (state is EditProfileLoaded) {
              Dialogs.successDialog(
                context,
                onSuccessFinishedCallback: (_) {
                  profileCubit.profileStatesHandled();
                  context.pop();
                },
              );
            }
          },
          buildWhen: (previous, current) =>
              current is EditProfileLoading ||
              current is EditProfileLoaded ||
              current is EditProfileError,
          builder: (context, state) {
            return DefaultButton(
              borderRadiusValue: 12.r,
              onPressed: () async {
                cubit.editUserProfile();
              },
              text: AppStrings.save.tr(),
              isLoading: state is EditProfileLoading ? true : false,
            );
          }),
    );
  }
}
