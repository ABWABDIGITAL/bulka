import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/shared/widgets/upload_image_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/services/categories/views/default_category_drop_down_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_company_size_drop_down_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_phone_form_field.dart';
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
            vSpace(20),
            ImageUploadScreen(
              onSelected: (image) {
                cubit.companyLogo = image;
              },
            ),
            vSpace(20),
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
            DefaultCategoryDropdownWidget(
              onSelected: (choosenCategory) {
                if (choosenCategory != null) {
                  cubit.categoryId = choosenCategory.id;
                }
              },
            ),
            vSpace(20),
            DefaultFormField(
              titleText: AppStrings.description.tr(),
              hintText: AppStrings.enterYourDescription.tr(),
              controller: cubit.descriptionController,
              maxLines: -1,
              keyboardType: TextInputType.multiline,
              prefixIcon: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.text_fields,
                    color: AppColors.iconGrey,
                  ),
                ],
              ),
            ),
            vSpace(20),
            DefaultFormField(
              titleText: AppStrings.website.tr(),
              hintText: AppStrings.enterYourWebsiteDomain.tr(),
              controller: cubit.websiteController,
              keyboardType: TextInputType.url,
              validator: (value) {
                String pattern =
                    r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                RegExp regExp = RegExp(pattern);
                if (value!.isEmpty) {
                  return 'Please enter url'.tr();
                } else if (!regExp.hasMatch(value)) {
                  return 'Please enter valid url'.tr();
                }
                return null;
              },
              prefixIcon: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.web,
                    color: AppColors.iconGrey,
                  ),
                ],
              ),
            ),
            vSpace(20),
            DefaultFormField(
              titleText: AppStrings.additionalDomain.tr(),
              hintText: AppStrings.enterYourAdditionalDomain.tr(),
              controller: cubit.additionalWebsiteController,
              keyboardType: TextInputType.url,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  String pattern =
                      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
                  RegExp regExp = RegExp(pattern);
                  if (value.isEmpty) {
                    return 'Please enter url'.tr();
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid url'.tr();
                  }
                  return null;
                } else {
                  return null;
                }
              },
              prefixIcon: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.web,
                    color: AppColors.iconGrey,
                  ),
                ],
              ),
            ),
            vSpace(20),
            DefaultCompanySizeDropdownWidget(
              onSelected: (choosenSize) {
                if (choosenSize != null) {
                  cubit.companySizeController.text = choosenSize;
                }
              },
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
