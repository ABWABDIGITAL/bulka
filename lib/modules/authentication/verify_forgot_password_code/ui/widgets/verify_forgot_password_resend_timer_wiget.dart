import 'dart:async';

import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/forgot_password/data/params/forgot_password_with_phone_params.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/controllers/verify_forgot_password_cubit.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/controllers/verify_forgot_password_state.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/abstractions/account_forgot_password.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyForgotPasswordResendTimerWiget extends StatefulWidget {
  const VerifyForgotPasswordResendTimerWiget(this.accountForgotPassword,
      {super.key});
  final AccountForgotPassword accountForgotPassword;
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
    final cubit = context.read<VerifyForgotPasswordCubit>();
    return BlocConsumer<VerifyForgotPasswordCubit, VerifyForgotPasswordState>(
      listener: (context, state) {
        if (state is ResendForgetPasswordSuccess) {
          _startTimer();
          Dialogs.customeToast(
            text: state.entity.message,
            context: context,
            isSuccess: true,
          );
        }
        if (state is ResendForgetPasswordError) {
          Dialogs.customeToast(
            text: state.error.message,
            context: context,
            isSuccess: false,
          );
        }
      },
      listenWhen: (previous, current) =>
          current is ResendForgetPasswordLoading ||
          current is ResendForgetPasswordSuccess ||
          current is ResendForgetPasswordError,
      buildWhen: (previous, current) =>
          current is ResendForgetPasswordLoading ||
          current is ResendForgetPasswordSuccess ||
          current is ResendForgetPasswordError,
      builder: (context, state) {
        return state is ResendForgetPasswordLoading
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
                            if (widget.accountForgotPassword.phone != null) {
                              cubit.resendVerifyPasswordViaPhoneStatesHandled(
                                ForgotPasswordWithPhoneParams(
                                  phone: widget.accountForgotPassword.phone!,
                                  phoneCode:
                                      widget.accountForgotPassword.phoneCode!,
                                ),
                              );
                            }
                          }
                        },
                    ),
                  ],
                ),
              );
      },
    );
  }
}
