import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_phone_form_field.dart';
import 'package:bulka/core/utils/widgets/validation/validation.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_cubit.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegisterFieldsWidget extends StatelessWidget {
  const UserRegisterFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserRegisterCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Form(
        key: cubit.userRegisterKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultFormField(
              titleText: AppStrings.fullname.tr(),
              hintText: AppStrings.enterYourFullName.tr(),
              controller: cubit.fullNameController,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetIcons.personFill,
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            vSpace(20),
            DefaultPhoneFormField(
              controller: cubit.phoneController,
              onCountryChangedReturnApiCountry: (country) {
                cubit.phoneCodeController.text = country.phoneCode;
                cubit.countryId = country.id;
              },
              // onCountryChanged: (country) {
              //   cubit.phoneCodeController.text = country.dialCode;
              //   context.read<CountryCubit>().countries?.forEach((element) {
              //     if (element.phoneCode == country.dialCode) {
              //       cubit.countryId = element.id;
              //     }
              //   });
              // },
            ),
            DefaultFormField(
              titleText: AppStrings.email.tr(),
              hintText: AppStrings.enterYourEmail.tr(),
              validator: (value) => validateEmail(value),
              controller: cubit.emailController,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetIcons.smstracking,
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            vSpace(20),
            BlocBuilder<UserRegisterCubit, UserRegisterState>(
              buildWhen: (previous, current) => current is ChangePasswordStatus,
              builder: (context, state) {
                return DefaultFormField(
                  titleText: AppStrings.password.tr(),
                  controller: cubit.passwordController,
                  obscureText: cubit.isVisiablePassword,
                  hintText: AppStrings.enterYourPassword.tr(),
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetIcons.lock1,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changeVisibilityPassword();
                    },
                    icon: Icon(
                      cubit.isVisiablePassword
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: AppColors.iconGrey,
                    ),
                  ),
                );
              },
            ),
            vSpace(20),
            BlocBuilder<UserRegisterCubit, UserRegisterState>(
              buildWhen: (previous, current) => current is ChangePasswordStatus,
              builder: (context, state) {
                return DefaultFormField(
                  titleText: AppStrings.confirmPassword.tr(),
                  controller: cubit.passwordConfirmController,
                  obscureText: cubit.isVisiableConfirm,
                  hintText: AppStrings.enterYourPassword.tr(),
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetIcons.lock1,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changeVisibilityConfirmPassword();
                    },
                    icon: Icon(
                      cubit.isVisiableConfirm
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: AppColors.iconGrey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
