import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_appbar_widget.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_background_widget.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_card_widget.dart';
import 'package:bulka/modules/authentication/reset_password/controllers/reset_password_cubit.dart';
import 'package:bulka/modules/authentication/reset_password/ui/widgets/reset_password_button_widget.dart';
import 'package:bulka/modules/authentication/reset_password/ui/widgets/reset_password_fields_widget.dart';
import 'package:bulka/modules/authentication/reset_password/ui/widgets/reset_password_title_widget.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/abstractions/account_forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.accountForgotPassword,
    required this.resetCode,
  });

  final AccountForgotPassword accountForgotPassword;
  final String resetCode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(sl())
        ..fillOtpVerificationData(
          accountForgotPassword.phone!,
          accountForgotPassword.phoneCode!,
          resetCode,
        ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F8FF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarheight),
          child: const ForgotPasswordAppbarWidget(),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const ForgotPasswordImageBackgroundWidget(
                imagePath: AssetIcons.secretLock),
            ForgotPasswordCardWidget(
              height: MediaQuery.sizeOf(context).height / 2,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ResetPasswordTitleWidget(),
                  ResetPasswordFieldsWidget(),
                  ResetPasswordButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
