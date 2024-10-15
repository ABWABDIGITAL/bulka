import 'dart:io';

import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SupportListTile extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  const SupportListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.grey)),
      leading: SvgPicture.asset(icon,height: 20,color:AppColors.primary ,),
      title: Text(title,style: TextStyles.rubik14W600Black,),
      subtitle: Text(description,style: TextStyles.rubik12W400DarkGrey4,),
      trailing: Icon(
          Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward_rounded,color: AppColors.darkGrey2,),
    );
  }
}
