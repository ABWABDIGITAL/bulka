import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatFormField extends StatelessWidget {
  const ChatFormField({super.key,this.controller});
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      titleText: AppStrings.chat.tr(),
      hintText: AppStrings.chat.tr(),
   
      controller: controller,
      prefixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetIcons.chatSvg,
            height: 20.h,
            width: 20.w,color: AppColors.darkGrey2,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}