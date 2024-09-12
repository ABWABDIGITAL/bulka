import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
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
    this.height,
    this.statusbarColor,
    this.statusBarIconBrightness,
  });
  final double? height;
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
  final Color? statusbarColor;
  final Brightness? statusBarIconBrightness;

  @override
  Widget build(BuildContext context) {
    final Color backcolor = backgroundColor ?? AppColors.white;
    return AppBar(
      elevation: elevation ?? 0,
      systemOverlayStyle: systemOverlayStyle ??
          SystemUiOverlayStyle(
            statusBarColor: statusbarColor ??
                (backcolor == AppColors.white
                    ? AppColors.white
                    : AppColors.primary),
            statusBarIconBrightness: statusBarIconBrightness ??
                (backcolor == AppColors.white
                    ? Brightness.dark
                    : Brightness.light),
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

  @override
  Size get preferredSize => Size.fromHeight(height ?? appbarheight);
}

class OpacityAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const OpacityAppbarWidget({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return CustomeAppBarWidget(
      backgroundColor: AppColors.opactiyPrimary,
      statusbarColor: AppColors.opactiyPrimary,
      statusBarIconBrightness: Brightness.dark,
      title: title ?? AppStrings.languages.tr(),
      centerTitle: true,
      titleStyle: TextStyles.rubik14W500Black,
      iconTheme: const IconThemeData(color: AppColors.black),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarheight);
}
