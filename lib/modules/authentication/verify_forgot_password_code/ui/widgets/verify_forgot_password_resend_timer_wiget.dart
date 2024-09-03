import 'dart:async';

import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyForgotPasswordResendTimerWiget extends StatefulWidget {
  const VerifyForgotPasswordResendTimerWiget({super.key});

  @override
  State<VerifyForgotPasswordResendTimerWiget> createState() =>
      _VerifyForgotPasswordResendTimerWigetState();
}

class _VerifyForgotPasswordResendTimerWigetState
    extends State<VerifyForgotPasswordResendTimerWiget> {
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
    return RichText(
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
                  _startTimer();
                }
              },
          ),
        ],
      ),
    );
  }
}
