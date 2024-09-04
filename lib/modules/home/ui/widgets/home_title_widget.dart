import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget(
    this.titleText, {
    super.key,
    this.onPressed,
    this.padding,
  });
  final String titleText;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: TextStyles.rubik14W500Black,
        ),
        if (onPressed != null)
          TextButton(
            onPressed: onPressed,
            child: Text(
              AppStrings.seeAll.tr(),
              style: TextStyles.rubik10W400Primary,
            ),
          )
      ],
    );
  }
}
