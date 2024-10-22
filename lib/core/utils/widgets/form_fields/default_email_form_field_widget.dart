import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/validation/validation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultEmailFormFieldWidget extends StatelessWidget {
  const DefaultEmailFormFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.suffixIcon
  });
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      onChanged:onChanged ,
      titleText: AppStrings.email.tr(),
      hintText: AppStrings.enterYourEmail.tr(),
      validator: (value) => validateEmail(value),
      controller: controller,
      suffixIcon: suffixIcon,
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
    );
  }
}
