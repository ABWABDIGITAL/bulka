import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static void open({
    required BuildContext context,
    bool? useRootNavigator,
    bool? isScrollControlled,
    bool? fullScreen,
    bool? isCurve,
    double? height,
    EdgeInsets? padding,
    bool? enableDrag,
    required Widget child,
    Color? backgroundColor,
    bool isDismissible = true,
  }) {
    showModalBottomSheet<dynamic>(
      backgroundColor: backgroundColor,
      isScrollControlled:
          isScrollControlled != null && isScrollControlled ? true : false,
      useRootNavigator:
          useRootNavigator != null && useRootNavigator ? true : false,
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag != null && enableDrag ? true : false,
      shape: fullScreen != null && (fullScreen && isCurve != true)
          ? null
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
      builder: (BuildContext bc) {
        return Padding(
          padding: padding ??
              const EdgeInsets.only(
                top: 20,
                bottom: 30,
                left: 24,
                right: 24,
              ),
          child: fullScreen == true
              ? SizedBox(
                  height: height,
                  child: child,
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SmallDivider(),
                    SizedBox(
                      height: height,
                      child: child,
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class SmallDivider extends StatelessWidget {
  const SmallDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 62,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}
