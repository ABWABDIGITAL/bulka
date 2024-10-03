import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/validation/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultPasswordFormFieldWidget extends StatelessWidget {
  const DefaultPasswordFormFieldWidget({
    super.key,
    this.changeVisiabiltyOnPressed,
    this.controller,
    this.isVisiable = true,
    this.title,
  });
  final bool isVisiable;
  final TextEditingController? controller;
  final void Function()? changeVisiabiltyOnPressed;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      titleText: title ?? AppStrings.password.tr(),
      controller: controller,
      obscureText: isVisiable,
      validator: (value) => validatePassword(value),
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
        onPressed: changeVisiabiltyOnPressed ?? () {},
        icon: Icon(
          isVisiable ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          color: AppColors.iconGrey,
        ),
      ),
    );
  }
}
