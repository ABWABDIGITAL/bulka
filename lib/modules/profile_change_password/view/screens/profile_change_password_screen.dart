import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/profile_change_password/controller/profile_change_password_cubit.dart';
import 'package:bulka/modules/profile_change_password/view/widgets/change_password_form_field.dart';
import 'package:bulka/modules/profile_change_password/view/widgets/profile_change_password_animation.dart';
import 'package:bulka/modules/profile_change_password/view/widgets/profile_change_password_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileChangePasswordScreen extends StatelessWidget {
  const ProfileChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.changePassword.tr(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.r),
        child: BlocProvider(
          create: (context) => ProfileChangePasswordCubit(sl()),
          child: Column(
            children: [
              Text(
                AppStrings.enterNewPassword.tr(),
                style: TextStyles.rubik16W700Black,
              ),
              vSpace(20),
              Text(
                AppStrings.changePasswordDescription.tr(),
                style:  TextStyles.rubik14W400DarkGrey5,
                textAlign: TextAlign.center,
              ),
              const ProfileChangePasswordAnimatedHeadphoneSparkle(),
              vSpace(20),
              const ProfileChangePasswordFormFields(),
              vSpace(60),
              const ProfileChangePasswordSaveButton()
            ],
          ),
        ),
      ),
    );
  }
}
