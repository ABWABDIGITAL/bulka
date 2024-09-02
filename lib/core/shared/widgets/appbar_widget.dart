import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeAppBarWidget extends StatelessWidget {
  const CustomeAppBarWidget({
    super.key,
    this.backgroundColor,
    this.actions,
    this.title,
    this.titleWidget,
    this.leading,
    this.elevation,
    this.needNavigateBack = false,
    this.titleStyle,
    this.centerTitle = false,
    this.flexibleSpace,
    this.toolbarHeight,
    this.shape,
    this.systemOverlayStyle,
    this.leadingWidth,
    this.iconTheme,
  });
  final Color? backgroundColor;
  final List<Widget>? actions;
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final double? elevation;
  final bool needNavigateBack;
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final Widget? flexibleSpace;
  final double? toolbarHeight;
  final ShapeBorder? shape;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double? leadingWidth;
  final IconThemeData? iconTheme;
  @override
  Widget build(BuildContext context) {
    final Color backcolor = backgroundColor ?? AppColors.white;
    return AppBar(
      elevation: elevation ?? 0,
      systemOverlayStyle: systemOverlayStyle ??
          SystemUiOverlayStyle(
            statusBarColor: backcolor == AppColors.white
                ? AppColors.white
                : AppColors.primary,
            statusBarIconBrightness: backcolor == AppColors.white
                ? Brightness.dark
                : Brightness.light,
            systemStatusBarContrastEnforced: true,
          ),
      iconTheme: iconTheme ??
          IconThemeData(
            color: backcolor == AppColors.white
                ? AppColors.black
                : AppColors.white,
          ),
      backgroundColor: backcolor,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      leading: leading ??
          (needNavigateBack
              ? IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.abc),
                )
              : null),
      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: titleStyle ?? TextStyles.dummy,
                )
              : null),
      actions: actions,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpace,
      shape: shape,
    );
  }
}
