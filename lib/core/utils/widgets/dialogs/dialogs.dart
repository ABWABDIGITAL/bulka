import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bulka/core/assets/asset_lottie.dart';
import 'package:bulka/core/services/haptic/haptic_vibrate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:lottie/lottie.dart';

class Dialogs {
  static showSnackBar({
    String? title,
    required String bodyMessage,
    int status = 1,
    required BuildContext context,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            bodyMessage,
            // color: AppColors.primary,
          ),
          duration: const Duration(seconds: 3),
          backgroundColor: status == 1 ? AppColors.white : AppColors.white,
        ),
      );

  static customeToast({
    required String text,
    required BuildContext context,
    required bool isSuccess,
    void Function()? onDismiss,
    StyledToastPosition? position,
  }) =>
      showToast(
        text,
        context: context,
        animation: StyledToastAnimation.fadeScale,
        reverseAnimation: StyledToastAnimation.sizeFade,
        position: position ?? StyledToastPosition.bottom,
        // animDuration: const Duration(milliseconds: 500),
        duration: const Duration(seconds: 3),
        textPadding: const EdgeInsets.all(8),
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
        onDismiss: onDismiss,
        backgroundColor: isSuccess ? AppColors.primary : AppColors.secondary,
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSuccess ? AppColors.transparent : AppColors.transparent,
          ),
        ),
        textStyle: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isSuccess ? AppColors.white : AppColors.white,
        ),
      );

  // //flutter pub add awesome_dialog
  static warningDialog({
    required BuildContext context,
    dynamic Function()? cancelButton,
    required dynamic Function() confirmButton,
    String? title,
    String? desc,
    bool? dismissOnBackKeyPress,
    bool? dismissOnTouchOutside,
    DialogType? dialogType,
    Widget? body,
  }) =>
      AwesomeDialog(
        context: context,
        dialogType: dialogType ?? DialogType.error,
        animType: AnimType.bottomSlide,
        body: body,
        title: title ?? 'Title',
        desc: desc ?? 'do you want to confirm',
        btnCancelOnPress: cancelButton,
        btnOkOnPress: confirmButton,
        dismissOnBackKeyPress: dismissOnBackKeyPress ?? true,
        dismissOnTouchOutside: dismissOnTouchOutside ?? true,
      ).show();
  static errorDialog({
    required BuildContext context,
    required final ApiErrorEntity error,
  }) {
    if (error.code == ResponseCode.unAuthorized) {
      Future.delayed(const Duration(seconds: 3), () async {
        // final isUser = await isUserLoggedIn();
        // if (isUser) {
        //   logout(context);
        // }
      });
    }
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dialogBackgroundColor: AppColors.white,
      borderSide: const BorderSide(color: AppColors.grey),
      padding: EdgeInsets.zero,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              error.message,
              style: TextStyles.rubik13W500Primary,
              textAlign: TextAlign.start,
            ),
            vSpace(20),
            if (error.errors != null && error.errors!.isNotEmpty)
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    error.errors!.length,
                    (index) => Text(
                      '- ${error.errors![index]}',
                      style: TextStyles.rubik13W400IconGrey,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            vSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefaultButton(
                  width: 100.h,
                  height: 30.w,
                  text: 'Got it!'.tr(),
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.grey,
                  textColor: AppColors.primary,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            vSpace(10),
          ],
        ),
      ),
    ).show();
  }

  static successDialog(
    BuildContext context, {
    void Function()? callback,
    FutureOr Function(void)? onSuccessFinishedCallback,
  }) {
    const int milliseconds = 1150;
    Timer(
        const Duration(milliseconds: milliseconds),
        callback ??
            () async {
              // await SoundHelper.successSound()
              //     .then(onSuccessFinishedCallback ?? (_) => context.pop());
            });
    Timer(
        const Duration(milliseconds: milliseconds - 50),
        callback ??
            () async {
              await HapticsHelper.vibrate(HapticsType.success);
            });

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.transparent,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Lottie.asset(
            AssetsLottie.checkSuccess,
            fit: BoxFit.contain,
            repeat: false,
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).width / 4,
          ),
        );
      },
    );
  }
}
