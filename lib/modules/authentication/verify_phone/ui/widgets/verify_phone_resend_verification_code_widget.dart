import 'dart:async';

import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_cubit.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPhoneResendVerificationCodeWidget extends StatefulWidget {
  const VerifyPhoneResendVerificationCodeWidget({super.key});

  @override
  State<VerifyPhoneResendVerificationCodeWidget> createState() =>
      _VerifyPhoneResendVerificationCodeWidgetState();
}

class _VerifyPhoneResendVerificationCodeWidgetState
    extends State<VerifyPhoneResendVerificationCodeWidget> {
  Timer? _timer;
  int _timerDuration = 60;
  bool _isResendCodeButtonActive = false;
  void _startTimer() {
    setState(() {
      _isResendCodeButtonActive = false;
      _timerDuration = 60;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerDuration > 0) {
        setState(() {
          _timerDuration--;
        });
      } else {
        setState(() {
          _timer?.cancel();
          _isResendCodeButtonActive = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 17.r),
      child: BlocConsumer<VerifyPhoneCubit, VerifyPhoneState>(
        listener: (context, state) {
          if (state is ResendVerifyPhoneOtpSuccess) {
            _startTimer();
            Dialogs.customeToast(
              text: state.verify.message,
              context: context,
              isSuccess: true,
            );
          }
          if (state is ResendVerifyPhoneOtpError) {
            Dialogs.customeToast(
              text: state.error.message,
              context: context,
              isSuccess: false,
            );
          }
        },
        listenWhen: (previous, current) =>
            current is ResendVerifyPhoneOtpLoading ||
            current is ResendVerifyPhoneOtpSuccess ||
            current is ResendVerifyPhoneOtpError,
        buildWhen: (previous, current) =>
            current is ResendVerifyPhoneOtpLoading ||
            current is ResendVerifyPhoneOtpSuccess ||
            current is ResendVerifyPhoneOtpError,
        builder: (context, state) {
          return state is ResendVerifyPhoneOtpLoading
              ? ShimmerTextWidget(AppStrings.loading.tr())
              : RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${AppStrings.didntReceiveACode.tr()} ',
                        style: TextStyles.rubik13W500HardGrey2,
                      ),
                      TextSpan(
                        text: "( ",
                        style: TextStyles.rubik13W500HardGrey2,
                      ),
                      TextSpan(
                        text: _timerDuration.toString(),
                        style: _isResendCodeButtonActive
                            ? TextStyles.rubik13W500IconGrey
                            : TextStyles.rubik13W500Red,
                      ),
                      TextSpan(
                        text: "s".tr(),
                        style: _isResendCodeButtonActive
                            ? TextStyles.rubik13W500IconGrey
                            : TextStyles.rubik13W500Red,
                      ),
                      TextSpan(
                        text: " )",
                        style: TextStyles.rubik13W500HardGrey2,
                      ),
                      TextSpan(
                        text: ' ${AppStrings.resendCode.tr()}',
                        style: _isResendCodeButtonActive
                            ? TextStyles.rubik13W500Primary
                            : TextStyles.rubik13W500IconGrey,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (_isResendCodeButtonActive) {
                              context
                                  .read<VerifyPhoneCubit>()
                                  .resendVerifyWithPhoneStatesHandled();
                            }
                          },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
