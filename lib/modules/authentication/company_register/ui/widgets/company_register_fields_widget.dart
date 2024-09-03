import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/validation/validation.dart';
import 'package:bulka/modules/authentication/company_register/controllers/company_register_cubit.dart';
import 'package:bulka/modules/authentication/company_register/controllers/company_register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyRegisterFieldsWidget extends StatelessWidget {
  const CompanyRegisterFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompanyRegisterCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Form(
        key: cubit.companyKey,
        child: Column(
          children: [
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
            BlocBuilder<CompanyRegisterCubit, CompanyRegisterState>(
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
            BlocBuilder<CompanyRegisterCubit, CompanyRegisterState>(
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
