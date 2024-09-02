import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    super.key,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.hoverColor,
    this.onPressed,
    this.text,
    this.textAlign,
    this.padding,
  });
  final String? text;
  final void Function()? onPressed;
  final Color? hoverColor;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final WidgetStateProperty<EdgeInsetsGeometry?>? padding;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text(
        text ?? 'View ALL',
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor ?? AppColors.grey,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
